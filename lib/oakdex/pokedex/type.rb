require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    class Type < Base
      translate :names, :name

      def effectivness_for(other_type)
        @source.effectivness[other_type]
      end
    end
  end
end
