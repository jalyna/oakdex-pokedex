require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the region in the pokemon world and its locations
    class Region < Base
      json_folder 'region'
      translate :names, :name
    end
  end
end
