require 'spec_helper'

describe Oakdex::Pokedex::Pokemon do
  let(:additional_attributes) { {} }
  let(:attributes) do
    {
      'names' => {
        'en' => 'Bulbasaur',
        'de' => 'Bisasam'
      },
      'types' => [
        'Grass',
        'Poison'
      ],
      'abilities' => [
        {
          'name' => 'Overgrow'
        },
        {
          'name' => 'Chlorophyll',
          'hidden' => true
        }
      ],
      'national_id' => 1,
      'gender_ratios' => {
        'male' => 87.5,
        'female' => 12.5
      },
      'catch_rate' => 45,
      'egg_groups' => [
        'Monster',
        'Grass'
      ],
      'hatch_time' => [
        5355,
        5609
      ],
      'height_us' => '2\'04"',
      'height_eu' => '0.7 m',
      'weight_us' => '15.2 lbs.',
      'weight_eu' => '6.9 kg',
      'base_exp_yield' => 64,
      'leveling_rate' => 'Medium Slow',
      'ev_yield' => {
        'hp'      => 0,
        'atk'     => 0,
        'def'     => 0,
        'sp_atk'  => 1,
        'sp_def'  => 0,
        'speed'   => 0
      },
      'color' => 'Green',
      'base_friendship' => 70,
      'base_stats' => {
        'hp'      => 45,
        'atk'     => 49,
        'def'     => 49,
        'sp_atk'  => 65,
        'sp_def'  => 65,
        'speed'   => 45
      },
      'learnset' => [
        {
          'level' => 0,
          'move'  => 'Tackle'
        },
        {
          'level' => 3,
          'move'  => 'Growl'
        },
        {
          'level' => 7,
          'move'  => 'Leech Seed'
        },
        {
          'tm'    => 'TM27',
          'move'  => 'Return'
        },
        {
          'parent'  => 'Trevenant',
          'move'    => 'Curse'
        }
      ]
    }.merge(additional_attributes)
  end

  subject { described_class.new(attributes) }

  describe '#name' do
    it { expect(subject.name).to eq('Bulbasaur') }
    it { expect(subject.name('de')).to eq('Bisasam') }
    it { expect(subject.name('nope')).to eq('Bulbasaur') }
  end

  describe '#types' do
    it { expect(subject.types.first).to be_a(Oakdex::Pokedex::Type) }
    it { expect(subject.types.last).to be_a(Oakdex::Pokedex::Type) }
    it { expect(subject.types.first.name).to eq('Grass') }
    it { expect(subject.types.last.name).to eq('Poison') }
  end

  %w(
    national_id
    abilities
    gender_ratios
    catch_rate
    egg_groups
    hatch_time
    height_us
    height_eu
    weight_us
    weight_eu
    base_exp_yield
    leveling_rate
    ev_yield
    color
    base_friendship
    base_stats
    learnset).each do |attribute|
    describe "##{attribute}" do
      it { expect(subject.public_send(attribute)).to eq(attributes[attribute]) }
    end
  end
end
