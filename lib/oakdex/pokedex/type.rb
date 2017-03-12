require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the type of a Pokemon
    class Type < Base
      json_folder 'type'
      translate :names, :name

      def effectivness_for(other_type)
        public_send(:effectivness)[other_type]
      end
    end
  end
end
