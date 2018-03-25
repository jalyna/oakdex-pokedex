require 'spec_helper'

describe Oakdex::Pokedex::Move do
  let(:additional_attributes) { {} }
  let(:attributes) do
    {
      'names' => {
        'en' => 'Ally Switch',
        'de' => 'Seitentausch'
      },
      'pokedex_entries' => {
        'Red' => {
          'en' => 'Description',
          'de' => 'Beschreibung'
        }
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
    }.merge(additional_attributes)
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Ally Switch') }
    it { expect(subject.name('de')).to eq('Seitentausch') }
    it { expect(subject.name('nope')).to eq('Ally Switch') }
  end

  describe '#stat_modifiers' do
    it { expect(subject.stat_modifiers).to eq([]) }

    context 'modifiers given' do
      let(:additional_attributes) do
        {
          'stat_modifiers' => [{
            'stat' => 'atk',
            'change_by' => '1'
          }]
        }
      end
      it {
        expect(subject.stat_modifiers)
        .to eq(additional_attributes['stat_modifiers'])
      }
    end
  end

  describe '#in_battle_properties' do
    it { expect(subject.in_battle_properties).to eq({}) }

    context 'in_battle_properties given' do
      let(:additional_attributes) do
        {
          'in_battle_properties' => {
            'increased_critical_hit_ratio' => true
          }
        }
      end
      it {
        expect(subject.in_battle_properties)
        .to eq(additional_attributes['in_battle_properties'])
      }
    end
  end

  describe '#description' do
    it { expect(subject.description).to eq('Description') }
    it { expect(subject.description('de')).to eq('Beschreibung') }
    it { expect(subject.description('nope')).to eq('Description') }
  end

  %w[
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
    affected_by_kings_rock].each do |attribute|
    describe "##{attribute}" do
      it { expect(subject.public_send(attribute)).to eq(attributes[attribute]) }
    end
  end

  describe '.find' do
    it 'returns move' do
      move = described_class.find('Aqua Ring')
      expect(move).to be_instance_of(Oakdex::Pokedex::Move)
    end

    it 'returns nil if move does not exist' do
      expect(described_class.find('Foo')).to be_nil
    end
  end

  describe '.where' do
    it 'filters by type' do
      collection = described_class.where(type: 'Grass')
      expect(collection.size).to eq(42)
      expect(collection.first.type).to eq('Grass')
      expect(collection.last.type).to eq('Grass')
    end
  end
end
