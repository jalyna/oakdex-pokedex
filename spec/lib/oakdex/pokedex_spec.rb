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

  describe '.find_nature' do
    it 'returns nature' do
      nature = described_class.find_nature('Modest')
      expect(nature).to be_instance_of(Oakdex::Pokedex::Nature)
    end

    it 'returns nil if nature does not exist' do
      expect(described_class.find_nature('Foo')).to be_nil
    end
  end

  describe '.find_ability' do
    it 'returns ability' do
      ability = described_class.find_ability('Battle Armor')
      expect(ability).to be_instance_of(Oakdex::Pokedex::Ability)
    end

    it 'returns nil if ability does not exist' do
      expect(described_class.find_ability('Foo')).to be_nil
    end
  end

  describe '.find_move' do
    it 'returns move' do
      move = described_class.find_move('Aqua Ring')
      expect(move).to be_instance_of(Oakdex::Pokedex::Move)
    end

    it 'returns nil if move does not exist' do
      expect(described_class.find_move('Foo')).to be_nil
    end
  end
end
