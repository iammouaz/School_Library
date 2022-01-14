require_relative '../book'

describe Book do
  context 'test class creation' do
    title = 'Harry Potter'
    author = 'J K Rowling'
    book = Book.new(title, author)

    it 'check title' do
      expect(book.title).to eq(title)
    end

    it 'check author' do
      expect(book.author).to eq(author)
    end

    it 'check if there is no rentals yet' do
      expect(book.rentals).to eq([])
    end

    it 'check if book is an instance of class Book' do
      expect(book).to be_a Book
    end
  end
end
