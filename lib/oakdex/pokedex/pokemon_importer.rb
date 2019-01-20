require 'oakdex/pokedex/invalid_pokemon_error'

module Oakdex
  module Pokedex
    # Handles Pokemon Import
    class PokemonImporter
      def initialize(custom_pokemon)
        pokemon_list = custom_pokemon.is_a?(Array) ?
          custom_pokemon : JSON.parse(custom_pokemon)
        @pokemon = pokemon_list.map do |p|
          p.is_a?(Hash) ? p : JSON.parse(p)
        end
      end

      def import!
        validate!
        Oakdex::Pokedex::Pokemon.add_to_all(@pokemon)
      end

      private

      def validate!
        @pokemon.each do |p|
          begin
            JSON::Validator.validate!(schema, p)
          rescue JSON::Schema::ValidationError => e
            pname = pokemon_name(p) || 'Unknown'
            raise InvalidPokemonError, "Invalid #{pname}: #{e.message}"
          end
        end
      end

      def schema
        @schema ||= JSON.parse(File.read(schema_path)).tap do |schema|
          schema['properties']['national_id']['minimum'] = 10001
          schema['properties']['national_id'].delete('maximum')
          schema['definitions']['pokemon']['enum'] = [nil] + available_pokemon
        end
      end

      def available_pokemon
        Pokemon.all.keys + @pokemon.map { |p| pokemon_name(p) }.compact
      end

      def pokemon_name(data)
        data.dig('names', 'en') ? data['names']['en'] : nil
      end

      def schema_path
        "#{Oakdex::Pokedex.data_dir}/schemas/pokemon.json"
      end
    end
  end
end
