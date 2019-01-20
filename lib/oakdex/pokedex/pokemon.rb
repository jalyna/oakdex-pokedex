require 'oakdex/pokedex/base'
require 'oakdex/pokedex/pokemon_importer'

module Oakdex
  module Pokedex
    # Represents the Pokemon
    class Pokemon < Base
      json_folder 'pokemon'
      translate :names, :name
      translate :categories, :category
      translate :variation_names, :variation_name

      def learnset
        move_learnsets.last['learnset']
      end

      def locations
        Region.all.values.map do |region|
          region.locations.map do |location|
            location['pokemon'].map do |p|
              next unless p['pokemon'] == name
              p.merge(
                'region' => region.name,
                'location' => location['names']['en']
              )
            end.compact
          end
        end.flatten
      end

      class << self
        def import!(custom_pokemon)
          PokemonImporter.new(custom_pokemon).import!
        end

        def all_by_id
          @all_by_id ||= Hash[all.map do |_k, pokemon|
            [pokemon.national_id, pokemon]
          end]
        end

        def add_to_all(custom_entries)
          @all_by_id = nil
          super(custom_entries)
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
