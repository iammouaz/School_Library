require_relative 'corrector'
require './rental'

class Person
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
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

  def to_s
    "Name: #{@name}, Age: #{@age}, ID: #{@id}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'age' => @age,
      'name' => @name
    }
  end

  def rent_book(date, book)
    Rental.new(date, book, self)
  end
end
