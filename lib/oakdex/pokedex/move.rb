require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the move of a Pokemon
    class Move < Base
      translate :names, :name
      translate :descriptions, :description

      def type
        Pokedex.find_type(@source.type)
      end
    end
  end
end
