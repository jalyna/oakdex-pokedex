require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the nature of a Pokemon
    class Nature < Base
      json_folder 'nature'
      translate :names, :name
    end
  end
end
