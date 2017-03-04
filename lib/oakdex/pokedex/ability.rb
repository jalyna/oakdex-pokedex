require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the ability of a Pokemon
    class Ability < Base
      translate :names, :name
      translate :descriptions, :description
    end
  end
end
