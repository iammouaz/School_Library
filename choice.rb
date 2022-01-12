require './student'
require './teacher'
require './book'
require './rental'

class Choice

  def list_books
    if @books.empty?
      puts 'There is no book registered in the library'
    else
      @books.each { |book| puts book }
    end
  end
private
  def list_people
    if @people.empty?
      puts 'There is no one registered in the library'
    else
      @people.each { |person| puts person }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Not a valid option'
      return
    end
    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    pp = gets.chomp
    @people.push(Student.new(name: name, age: age, parent_permission: translate_answer(pp.downcase)))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(name: name, age: age, specialization: specialization))
  end

  def translate_answer(ans)
    %w[yes y].include?(ans)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    book_i = gets.chomp
    puts ''
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_i = gets.chomp
    puts ''
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_i.to_i], @people[person_i.to_i]))
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_i = gets.chomp
    puts ''
    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == @people[person_i.to_i].id }
  end
end