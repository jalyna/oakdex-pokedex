require 'spec_helper'

describe Oakdex::Pokedex::Type do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Fairy',
        'de' => 'Fee'
      },
      'effectivness' => {
        'Normal' => 1.0
      },
      'color' => '#000000'
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Fairy') }
    it { expect(subject.name('de')).to eq('Fee') }
    it { expect(subject.name('nope')).to eq('Fairy') }
  end

  describe '#effectivness_for' do
    it { expect(subject.effectivness_for('Normal')).to eq(1.0) }
    it { expect(subject.effectivness_for('Foo')).to be_nil }
  end

  describe '#color' do
    it { expect(subject.color).to eq('#000000') }
  end

  describe '.find' do
    it 'returns type' do
      type = described_class.find('Fairy')
      expect(type).to be_instance_of(Oakdex::Pokedex::Type)
    end

    it 'returns nil if type does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end
end
