require 'spec_helper'

describe Oakdex::Pokedex::EggGroup do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Dragon',
        'de' => 'Drachen'
      }
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Dragon') }
    it { expect(subject.name('de')).to eq('Drachen') }
    it { expect(subject.name('nope')).to eq('Dragon') }
  end

  describe '.find' do
    it 'returns egg group' do
      egg_group = described_class.find('Flying')
      expect(egg_group).to be_instance_of(Oakdex::Pokedex::EggGroup)
    end

    it 'returns nil if egg group does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
