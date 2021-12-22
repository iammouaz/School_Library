require_relative 'corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age: 11, name: 'Unknown', parent_permission: true); end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end
end
