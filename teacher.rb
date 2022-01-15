require_relative 'person'
require 'json'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id:, age:, specialization:, name: 'Unknown')
    super(id: id, age: age, name: name)
    @parent_permission = true
    @specialization = specialization
  end

  def can_use_services
    true
  end

  def to_s
    "[Teacher] #{super}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization
    }
  end
end
