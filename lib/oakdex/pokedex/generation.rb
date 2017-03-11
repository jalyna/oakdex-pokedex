require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents one Generation and its Games
    class Generation < Base
      json_folder 'generation'
      translate :names, :name
    end
  end
end
