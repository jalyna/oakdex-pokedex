require 'spec_helper'

describe Oakdex::Pokedex::Region do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Kanto',
        'de' => 'KantoDe'
      },
      'locations' => [
        {
          'names' => {
            'en' => 'Route 1'
          },
          'pokemon' => [
            {
              'pokemon' => 'Pidgey',
              'location' => 'Walking',
              'min_level' => 2,
              'max_level' => 4,
              'rarity' => 'common',
              'games' => %w[HeartGold SoulSilver],
              'day_times' => %w[morning day]
            }
          ]
        }
      ]
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Kanto') }
    it { expect(subject.name('de')).to eq('KantoDe') }
    it { expect(subject.name('nope')).to eq('Kanto') }
  end

  describe '.find' do
    it 'returns region' do
      type = described_class.find('Johto')
      expect(type).to be_instance_of(Oakdex::Pokedex::Region)
    end

    it 'returns nil if region does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
