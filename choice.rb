require './student'
require './teacher'
require './book'
require './rental'
require 'json'
require './data'

class HandleMenuChoice
  def initialize
    @people = HandlePerson.new
    @people.read_people_json
    @books = HandleBooks.new
    @books.read_books_json
    @rentals = HandleRentals.new
    @rentals.read_rentals_json(@people.people, @books.books)
  end

  def saving_exit
    puts 'Saving'
    @data = Data.new
    @data.save(people: @people.people, books: @books.books, rentals: @rentals.rentals)
  end

  def list_books
    @books.list_books
  end

  def list_people
    @people.list_people
  end

  def list_rentals
    puts 'Select a person from the following list by number (not id)'
    @people.list_people_with_index
    person_i = gets.chomp
    @rentals.get_rentals(@people.get_id_from_index(person_i.to_i))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      print 'Has parent permission? [Y/N]: '
      pp = gets.chomp
      @people.create_student(nil, age, name, pp)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people.create_teacher(nil, age, name, specialization)
    else
      puts 'Not a valid option'
      return
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.add_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.list_books_with_index
    book_i = gets.chomp
    puts ''
    puts 'Select a person from the following list by number (not id)'
    @people.list_people_with_index
    person_i = gets.chomp
    puts ''
    print 'Date: '
    date = gets.chomp
    @rentals.add_rental(date, @books.get_book_from_index(book_i.to_i), @people.get_person_from_index(person_i.to_i))
    puts 'Rental created successfully'
  end
end

class HandlePerson
  attr_reader :people

  def initialize
    @people = []
  end

  def read_people_json
    file = 'people.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |p|
        if p['specialization'].nil?
          create_student(p['id'], p['age'], p['name'], p['pp'].to_s)
        else
          create_teacher(p['id'], p['age'], p['name'], p['specialization'])
        end
      end
    else
      []
    end
  end

  def translate_answer(ans)
    %w[yes y].include?(ans)
  end

  def create_student(id, age, name, pp)
    @people.push(Student.new(id: id, name: name, age: age, parent_permission: translate_answer(pp.downcase)))
  end

  def create_teacher(id, age, name, specialization)
    @people.push(Teacher.new(id: id, name: name, age: age, specialization: specialization))
  end

  def list_people
    if @people.empty?
      puts 'There is no one registered in the library'
    else
      @people.each { |person| puts person }
    end
  end

  def list_people_with_index
    if @people.empty?
      puts 'There is no one registered in the library'
    else
      @people.each_with_index { |person, index| puts "#{index}) #{person}" }
    end
  end

  def get_id_from_index(index)
    @people[index].id
  end

  def get_person_from_index(index)
    @people[index]
  end
end

class HandleBooks
  attr_reader :books

  def initialize
    @books = []
  end

  def read_books_json
    file = 'books.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |b|
        add_book(b['title'], b['author'])
      end
    else
      []
    end
  end

  def add_book(title, author)
    @books.push(Book.new(title, author))
  end

  def list_books
    if @books.empty?
      puts 'There is no book registered in the library'
    else
      @books.each { |book| puts book }
    end
  end

  def list_books_with_index
    if @books.empty?
      puts 'There is no book registered in the library'
    else
      @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    end
  end

  def get_book_from_index(index)
    @books[index]
  end
end

class HandleRentals
  attr_reader :rentals

  def initialize
    @rentals = []
  end

  def read_rentals_json(people = [], books = [])
    file = 'rentals.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |r|
        person = people.find { |p| p.id == r['person']['id'] }
        book = books.find { |b| b.title == r['book']['title'] }
        add_rental(r['date'], book, person)
      end
    else
      []
    end
  end

  def add_rental(date, book, person)
    @rentals.push(Rental.new(date, book, person))
  end

  def get_rentals(person_id)
    puts ''
    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == person_id }
  end
end
