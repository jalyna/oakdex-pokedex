require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the Pokemon
    class Pokemon < Base
      translate :names, :name

      def types
        @source.types.map do |type_name|
          Pokedex.find_type(type_name)
        end
      end
    end
  end
end
