require 'json'

class Save
  def save(people:, books:, rentals:)
    File.write('people.json', JSON.generate(people.map(&:to_json))) unless people.empty?
    File.write('books.json', JSON.generate(books.map(&:to_json))) unless books.empty?
    File.write('rentals.json', JSON.generate(rentals.map(&:to_json))) unless rentals.empty?
  end
end
