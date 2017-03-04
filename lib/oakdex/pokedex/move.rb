require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the move of a Pokemon
    class Move < Base
      json_folder 'move'
      translate :names, :name
      translate :descriptions, :description

      def type
        Type.find(@source.type)
      end
    end
  end
end
