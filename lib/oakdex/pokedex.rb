require 'json'
require 'oakdex/pokedex/type'
require 'oakdex/pokedex/nature'
require 'oakdex/pokedex/ability'
require 'oakdex/pokedex/move'
require 'oakdex/pokedex/pokemon'

module Oakdex
  # Class that handles Pokedex Requests
  module Pokedex
    class << self
      def types
        @types ||= map_json_data('type', Type)
      end

      def find_type(name)
        types[name]
      end

      def natures
        @natures ||= map_json_data('nature', Nature)
      end

      def find_nature(name)
        natures[name]
      end

      def abilities
        @abilities ||= map_json_data('ability', Ability)
      end

      def find_ability(name)
        abilities[name]
      end

      def moves
        @moves ||= map_json_data('move', Move)
      end

      def find_move(name)
        moves[name]
      end

      def pokemon_by_name
        @pokemon_by_name ||= map_json_data('pokemon', Pokemon)
      end

      def pokemon_by_id
        @pokemon_by_id ||= Hash[pokemon_by_name.map do |_k, pokemon|
          [pokemon.national_id, pokemon]
        end]
      end

      def find_pokemon(name)
        pokemon_by_name[name] || pokemon_by_id[name]
      end
    end
  end
end
