require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the type of a Pokemon
    class Type < Base
      translate :names, :name

      def effectivness_for(other_type)
        @source.effectivness[other_type]
      end
    end
  end
end
