require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the nature of a Pokemon
    class Item < Base
      json_folder 'item'
      translate :names, :name
    end
  end
end
