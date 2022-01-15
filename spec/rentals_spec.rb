require_relative '../book'
require_relative '../rental'
require_relative '../student'
require_relative '../teacher'

describe Rental do
  context 'test class creation' do
    book = Book.new('Harry Potter', 'J K Rowling')
    student = Student.new(id: nil, name: 'Juan', age: 20, parent_permission: true)
    teacher = Teacher.new(id: nil, name: 'Ana', age: 50, specialization: 'Spanish')
    date = '2020-12-12'
    rental = Rental.new(date, book, student)
    rental_teacher = Rental.new('2020-11-02', book, teacher)

    it 'check creation of a rental' do
      expect(rental.to_s) == ("Date: #{@date}, Book \"#{book.title}\" by #{book.author}")
    end

    it 'check is book has two rentals' do
      expect(book.rentals.length).to eq(2)
    end

    it 'check is book has the correct rental' do
      expect(book.rentals[0]).to eq(rental)
    end

    it 'check is student has a rental' do
      expect(student.rentals.length).to eq(1)
    end

    it 'check is student has the correct rental' do
      expect(student.rentals[0]).to eq(rental)
    end

    it 'check is teacher has a rental' do
      expect(teacher.rentals.length).to eq(1)
    end

    it 'check is teacher has the correct rental' do
      expect(teacher.rentals[0]).to eq(rental_teacher)
    end

    it 'check if rental is an instance of class Rental' do
      expect(rental).to be_a Rental
    end
  end
end
