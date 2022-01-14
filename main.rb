require './choice'
require './book'
require './rental'
require './data'
require 'json'

class App
  def initialize
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person',
      '7' => 'Save and Exit'
    }
    @handle_menu_choices = HandleMenuChoice.new
  end

  def run
    puts 'Welcome to School Library App!'

    loop do
      puts ''
      puts 'Please choose an option by eterin a number:'
      @options.each { |key, value| puts "#{key}) #{value}" }
      option = gets.chomp
      if option == '7'
        @handle_menu_choices.saving_exit
        break
      end

      menu_choice option
    end
  end

  def menu_choice(option)
    case option
    when '1'
      @handle_menu_choices.list_books
    when '2'
      @handle_menu_choices.list_people
    when '3'
      @handle_menu_choices.create_person
    when '4'
      @handle_menu_choices.create_book
    when '5'
      @handle_menu_choices.create_rental
    when '6'
      @handle_menu_choices.list_rentals
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
