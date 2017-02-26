require 'spec_helper'

describe Oakdex::Pokedex do
  describe '.find_type' do
    it 'returns type' do
      type = described_class.find_type('Fairy')
      expect(type).to be_instance_of(Oakdex::Pokedex::Type)
    end

    it 'returns nil if type does not exist' do
      expect(described_class.find_type('Foo')).to be_nil
    end
  end
end
