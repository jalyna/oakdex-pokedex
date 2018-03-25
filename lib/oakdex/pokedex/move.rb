require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the move of a Pokemon
    class Move < Base
      json_folder 'move'
      translate :names, :name

      def pp
        @attributes['pp']
      end

      def stat_modifiers
        @attributes['stat_modifiers'] || []
      end

      def in_battle_properties
        @attributes['in_battle_properties'] || {}
      end

      def description(lang = 'en')
        @attributes['pokedex_entries'].values.last[lang] ||
          @attributes['pokedex_entries'].values.last['en']
      end
    end
  end
end
