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

        def where(conditions = {})
          conditions[:types] = conditions.delete(:type) if conditions[:type]
          if conditions[:egg_group]
            conditions[:egg_groups] = conditions.delete(:egg_group)
          end
          return by_dex(conditions[:dex]) if conditions[:dex]
          super(conditions)
        end

        private

        def by_dex(dex)
          all.values.select do |entry|
            !entry.public_send("#{dex}_id").nil?
          end.sort_by(&:"#{dex}_id")
        end
      end
    end
  end
end
