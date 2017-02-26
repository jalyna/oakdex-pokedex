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
      }
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
end
