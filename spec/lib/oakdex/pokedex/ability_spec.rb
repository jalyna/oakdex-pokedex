require 'spec_helper'

describe Oakdex::Pokedex::Ability do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Adaptability',
        'de' => 'Anpassung'
      },
      'descriptions' => {
        'en' => 'Description',
        'de' => 'Beschreibung'
      },
      'index_number' => 91,
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Adaptability') }
    it { expect(subject.name('de')).to eq('Anpassung') }
    it { expect(subject.name('nope')).to eq('Adaptability') }
  end

  describe '#description' do
    it { expect(subject.description).to eq('Description') }
    it { expect(subject.description('de')).to eq('Beschreibung') }
    it { expect(subject.description('nope')).to eq('Description') }
  end

  describe '#index_number' do
    it { expect(subject.index_number).to eq(91) }
  end
end
