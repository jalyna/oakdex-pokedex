require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the move of a Pokemon
    class Move < Base
      json_folder 'move'
      translate :names, :name
      translate :descriptions, :description

      def pp
        @attributes['pp']
      end

      def stat_modifiers
        @attributes['stat_modifiers'] || []
      end

      def in_battle_properties
        @attributes['in_battle_properties'] || {}
      end
    end
  end
end
