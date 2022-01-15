require_relative '../classroom'

describe Classroom do
  context 'test classroom class creation' do
    label = 'Class 202'
    classroom = Classroom.new(label)

    it 'check class label' do
      expect(classroom.label).to eq(label)
    end

    it 'check if classroom is an instance of class Classroom' do
      expect(classroom).to be_a Classroom
    end
  end
end
