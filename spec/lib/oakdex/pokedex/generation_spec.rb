require 'spec_helper'

describe Oakdex::Pokedex::Generation do
  let(:attributes) do
    {
      'number' => 1,
      'names' => {
        'en' => 'One',
        'de' => 'Eins'
      },
      'dex_name' => 'kanto_id',
      'games' => [
        {
          'en' => 'Red',
          'de' => 'Rot'
        }
      ]
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('One') }
    it { expect(subject.name('de')).to eq('Eins') }
    it { expect(subject.name('nope')).to eq('One') }
  end

  describe '#number' do
    it { expect(subject.number).to eq(1) }
  end

  describe '#dex_name' do
    it { expect(subject.dex_name).to eq('kanto_id') }
  end

  describe '#games' do
    it { expect(subject.games).to eq(attributes['games']) }
  end

  describe '.find' do
    it 'returns generation' do
      generation = described_class.find('Generation I')
      expect(generation).to be_instance_of(Oakdex::Pokedex::Generation)
    end

    it 'returns nil if generation does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
