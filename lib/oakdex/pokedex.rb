require 'json'
require 'oakdex/pokedex/type'
require 'oakdex/pokedex/nature'
require 'oakdex/pokedex/ability'
require 'oakdex/pokedex/move'

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

      private

      def map_json_data(type, klass)
        Hash[Dir["data/#{type}/*.json"].map do |file_name|
          data = JSON.parse(File.read(file_name))
          [data['names']['en'], klass.new(data)]
        end]
      end
    end
  end
end
