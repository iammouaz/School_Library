require './choice'

class App
  def initialize
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person',
      '7' => 'Exit'
    }
    @menu_choices = MenuChoice.new
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
      @menu_choices.list_books
    when '2'
      @menu_choices.list_people
    when '3'
      @menu_choices.create_person
    when '4'
      @menu_choices.create_book
    when '5'
      @menu_choices.create_rental
    when '6'
      @menu_choices.list_rentals
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
