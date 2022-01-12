require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './choice'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person',
      '7' => 'Exit'
    }
    @handle_menu = Choice.new
  end

  def run
    puts 'Welcome to School Library App!'

    loop do
      puts ''
      puts 'Please choose an option by eterin a number:'
      @options.each { |key, value| puts "#{key}) #{value}" }
      option = gets.chomp
      break if option == '7'

      menu_choice option
    end
  end

  def menu_choice(option)
    case option
    when '1'
      @handle_menu.list_books
    when '2'
      @handle_menu.list_people
    when '3'
      @handle_menu.create_person
    when '4'
      @handle_menu.create_book
    when '5'
      @handle_menu.create_rental
    when '6'
      @handle_menu.list_rentals
    else
      puts 'Not a valid option'
    end
  
  end

  
end

def main
  app = App.new
  app.run
end

main
