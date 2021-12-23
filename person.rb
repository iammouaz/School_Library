require_relative 'corrector'
require './rental'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age: 11, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def rent_book(date, book)
    Rental.new(date, book, self)
  end
  
end
