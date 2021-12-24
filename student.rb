require_relative 'person'
require  'pry'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name: 'Unknown', parent_permission: true, classroom: 'None')
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end

puts Student.new(age:12, name:'Moaz')
puts Student.new(age:21, name:'Bob')
puts Student.new(age:'45', name:'Mike')
puts Student.new(age:53, name:'Ahmad')
puts Student.new(age:23, name:'Michel')
puts Student.new(age:43, name:'Zein')
