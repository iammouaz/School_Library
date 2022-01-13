require 'json'

class Data
  def save(people:, books:, rentals:)
    File.open('people.json', 'w') { |f| f.write(JSON.generate(people.map(&:to_json))) } unless people.empty?
    File.open('books.json', 'w') { |f| f.write(JSON.generate(books.map(&:to_json))) } unless books.empty?
    File.open('rentals.json', 'w') { |f| f.write(JSON.generate(rentals.map(&:to_json))) } unless rentals.empty?
  end
end
