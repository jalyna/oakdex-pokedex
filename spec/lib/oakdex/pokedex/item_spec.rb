require 'spec_helper'

describe Oakdex::Pokedex::Item do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Full Restore',
        'de' => 'Top-Genesung'
      },
      'category' => 'Potions',
      'descriptions' => [
        {
          'games' => ['Gold', 'Silver'],
          'translations' => {
            'en' => 'Fully restores HP & status.',
            'de' => 'Stellt KP und Status wieder her.'
          }
        }
      ],
      'prices' => [
        {
          'games' => ['Gold', 'Silver'],
          'buying' => 3000,
          'selling' => 1500
        }
      ],
      'pockets' => [
        {
          'generations' => [1, 2, 3],
          'pocket' => 'Medicine'
        }
      ],
      'fling_power' => 30,
      'effects' => []
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Full Restore') }
    it { expect(subject.name('de')).to eq('Top-Genesung') }
    it { expect(subject.name('nope')).to eq('Full Restore') }
  end

  describe '.find' do
    it 'returns item' do
      item = described_class.find('Full Restore')
      expect(item).to be_instance_of(Oakdex::Pokedex::Item)
    end

    it 'returns nil if item does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
