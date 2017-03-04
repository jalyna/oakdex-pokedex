require 'spec_helper'

describe Oakdex::Pokedex::Nature do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Impish',
        'de' => 'Pfiffig'
      },
      'increased_stat'  => 'def',
      'decreased_stat'  => 'sp_atk',
      'favorite_flavor' => 'Sour',
      'disliked_flavor' => 'Dry'
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Impish') }
    it { expect(subject.name('de')).to eq('Pfiffig') }
    it { expect(subject.name('nope')).to eq('Impish') }
  end

  describe '#increased_stat' do
    it { expect(subject.increased_stat).to eq('def') }
  end

  describe '#decreased_stat' do
    it { expect(subject.decreased_stat).to eq('sp_atk') }
  end

  describe '#favorite_flavor' do
    it { expect(subject.favorite_flavor).to eq('Sour') }
  end

  describe '#disliked_flavor' do
    it { expect(subject.disliked_flavor).to eq('Dry') }
  end

  describe '.find' do
    it 'returns nature' do
      nature = described_class.find('Modest')
      expect(nature).to be_instance_of(Oakdex::Pokedex::Nature)
    end

    it 'returns nil if nature does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
