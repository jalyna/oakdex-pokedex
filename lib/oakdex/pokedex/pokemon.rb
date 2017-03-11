require 'oakdex/pokedex/base'

module Oakdex
  module Pokedex
    # Represents the Pokemon
    class Pokemon < Base
      json_folder 'pokemon'
      translate :names, :name
      translate :categories, :category
      translate :variation_names, :variation_name

      class << self
        def all_by_id
          @all_by_id ||= Hash[all.map do |_k, pokemon|
            [pokemon.national_id, pokemon]
          end]
        end

        def find(name)
          all[name] || all_by_id[name]
        end
      end

      def types
        @source.types.map do |type_name|
          Type.find(type_name)
        end
      end
    end
  end
end
