require 'spec_helper'

describe Oakdex::Pokedex::PokemonImporter do
  let(:file1) { File.read(File.expand_path('../../../../../fixtures/fakemon1.json', __FILE__)) }
  let(:file2) { File.read(File.expand_path('../../../../../fixtures/fakemon2.json', __FILE__)) }

  let(:fakemon1) { file1 }
  let(:fakemon2) { file2 }
  subject { described_class.new([fakemon1, fakemon2]) }

  describe '.import!' do
    after { Oakdex::Pokedex::Pokemon.reset! }

    it 'imports given fakemon' do
      expect(Oakdex::Pokedex::Pokemon.find('Fakemon1')).to be_nil
      expect(Oakdex::Pokedex::Pokemon.find('Fakemon2')).to be_nil
      subject.import!
      expect(Oakdex::Pokedex::Pokemon.find('Fakemon1')).not_to be_nil
      expect(Oakdex::Pokedex::Pokemon.find('Fakemon2')).not_to be_nil
    end

    context 'by json string' do
      subject { described_class.new([file1, file2]) }

      it 'imports given fakemon' do
        subject.import!
        expect(Oakdex::Pokedex::Pokemon.find('Fakemon1')).not_to be_nil
        expect(Oakdex::Pokedex::Pokemon.find('Fakemon2')).not_to be_nil
      end
    end

    context 'national_id is lower than 10001' do
      let(:fakemon1) do
        JSON.parse(file1).tap do |p|
          p['national_id'] = 151
        end
      end

      it 'raises error' do
        expect { subject.import! }.to raise_error(Oakdex::Pokedex::InvalidPokemonError)
      end
    end
  end
end
