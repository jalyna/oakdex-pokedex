require 'spec_helper'

describe Oakdex::Pokedex::Move do
  let(:attributes) do
    {
      'names' => {
        'en' => 'Ally Switch',
        'de' => 'Seitentausch'
      },
      'descriptions' => {
        'en' => 'Description',
        'de' => 'Beschreibung'
      },
      'type'                    => 'Psychic',
      'index_number'            => 502,
      'pp'                      => 15,
      'max_pp'                  => 24,
      'power'                   => 0,
      'accuracy'                => 0,
      'category'                => 'status',
      'priority'                => 1,
      'target'                  => 'user',
      'critical_hit'            => 0,
      'makes_contact'           => false,
      'affected_by_protect'     => false,
      'affected_by_magic_coat'  => false,
      'affected_by_snatch'      => false,
      'affected_by_mirror_move' => false,
      'affected_by_kings_rock'  => false
    }
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Ally Switch') }
    it { expect(subject.name('de')).to eq('Seitentausch') }
    it { expect(subject.name('nope')).to eq('Ally Switch') }
  end

  describe '#description' do
    it { expect(subject.description).to eq('Description') }
    it { expect(subject.description('de')).to eq('Beschreibung') }
    it { expect(subject.description('nope')).to eq('Description') }
  end

  describe '#type' do
    it { expect(subject.type).to be_a(Oakdex::Pokedex::Type) }
    it { expect(subject.type.name).to eq('Psychic') }
  end

  %w(
    index_number
    pp
    max_pp
    power
    accuracy
    category
    priority
    target
    critical_hit
    makes_contact
    affected_by_protect
    affected_by_magic_coat
    affected_by_snatch
    affected_by_mirror_move
    affected_by_kings_rock).each do |attribute|
    describe "##{attribute}" do
      it { expect(subject.public_send(attribute)).to eq(attributes[attribute]) }
    end
  end
end
