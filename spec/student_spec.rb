require_relative '../student'
require_relative '../person'
describe Student do
  context 'test class creation' do
    name = 'Jose'
    age = 17
    parent_permission = false
    student = Student.new(id: nil, name: name, age: age, parent_permission: parent_permission)
    it 'check name' do
      expect(student.name).to eq(name)
    end
    it 'check age' do
      expect(student.age).to eq(age)
    end
    it 'check parent permission' do
      expect(student.parent_permission).to eq(false)
    end
    it 'check classroom' do
      expect(student.classroom).to eq('None')
    end
    it 'check if there is no rentals yet' do
      expect(student.rentals).to eq([])
    end
    it 'check if student is an instance of class Person' do
      expect(student).to be_a Person
    end
    it 'check if student is an instance of class Student' do
      expect(student).to be_a Student
    end
  end
end