require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the nature of a Pokemon
    class Item < Base
      json_folder 'item'
      translate :names, :name

      def description(locale = 'en')
        translations = descriptions.last['translations']
        translations[locale] || translations['en']
      end
    end
  end
end
