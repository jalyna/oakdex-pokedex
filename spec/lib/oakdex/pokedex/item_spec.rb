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
        },
        {
          'games' => ['X', 'Y'],
          'translations' => {
            'en' => 'A medicine that can be used to fully restore the HP of a single Pokémon and heal any status conditions it has.',
            'de' => 'Dieses Item stellt alle KP eines Pokémon wieder her und behebt alle Statusprobleme.'
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

  describe '#description' do
    it { expect(subject.description).to eq('A medicine that can be used to fully restore the HP of a single Pokémon and heal any status conditions it has.') }
    it { expect(subject.description('de')).to eq('Dieses Item stellt alle KP eines Pokémon wieder her und behebt alle Statusprobleme.') }
    it { expect(subject.description('nope')).to eq('A medicine that can be used to fully restore the HP of a single Pokémon and heal any status conditions it has.') }
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
