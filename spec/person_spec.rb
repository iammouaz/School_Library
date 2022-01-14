require_relative '../person'

describe Person do
  context 'test class creation' do
    name = 'John Doe'
    age = 42
    parent_permission = true

    person = Person.new(id: nil, name: name, age: age, parent_permission: parent_permission)

    it 'check name' do
      expect(person.name).to eq(name)
    end

    it 'check age' do
      expect(person.age).to eq(age)
    end

    it 'check if there is no rentals yet' do
      expect(person.rentals).to eq([])
    end

    it 'check if person is an instance of class Person' do
      expect(person).to be_a Person
    end
  end

  context 'test class creation with empty fields and given ID' do
    id = '123456789'
    age = 33

    person = Person.new(id: id, age: age)

    it 'check name' do
      expect(person.name).to eq('Unknown')
    end

    it 'check id if its the same as given on constructor' do
      expect(person.id).to eq(id)
    end

    it 'check permission is true (default)' do
      expect(person.parent_permission).to eq(true)
    end
  end
end
