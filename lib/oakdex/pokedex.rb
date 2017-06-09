require 'json'
require 'oakdex/pokedex/type'
require 'oakdex/pokedex/nature'
require 'oakdex/pokedex/ability'
require 'oakdex/pokedex/move'
require 'oakdex/pokedex/pokemon'
require 'oakdex/pokedex/egg_group'
require 'oakdex/pokedex/generation'

module Oakdex
  # Class that handles Pokedex Requests
  module Pokedex
    def self.root
      File.expand_path '../../../', __FILE__
    end

    def self.data_dir
      File.join root, 'data'
    end
  end
end
