require_relative '../teacher'
require_relative '../person'
describe Teacher do
  context 'test class creation' do
    name = 'Maria'
    age = 33
    specialization = 'Math'
    teacher = Teacher.new(id: nil, name: name, age: age, specialization: specialization)
    it 'check name' do
      expect(teacher.name).to eq(name)
    end
    it 'check age' do
      expect(teacher.age).to eq(age)
    end
    it 'check parent permission' do
      expect(teacher.parent_permission).to eq(true)
    end
    it 'check specialization' do
      expect(teacher.specialization).to eq(specialization)
    end
    it 'check if there is no rentals yet' do
      expect(teacher.rentals).to eq([])
    end
    it 'check if student is an instance of class Person' do
      expect(teacher).to be_a Person
    end
    it 'check if student is an instance of class Student' do
      expect(teacher).to be_a Teacher
    end
  end
end