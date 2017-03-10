require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the egg group of a Pokemon
    class EggGroup < Base
      json_folder 'egg_group'
      translate :names, :name
    end
  end
end
