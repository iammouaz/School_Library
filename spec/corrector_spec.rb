require_relative '../corrector'

describe Corrector do
  context 'test class Corrector' do
    name = 'harry Potter'
    corrector = Corrector.new

    it 'check that name is correct' do
      expect(corrector.correct_name(name)).to eq('Harry pott')
    end

    it 'check if corrector is an instance of class Corrector' do
      expect(corrector).to be_a Corrector
    end
  end
end
