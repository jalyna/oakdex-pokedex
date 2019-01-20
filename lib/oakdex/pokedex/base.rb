require 'ostruct'

module Oakdex
  module Pokedex
    # Base Class for Dex Entries
    class Base
      class << self
        def json_folder(folder = nil)
          @folder = folder if folder
          @folder
        end

        def translate(attribute, name)
          define_method(name) do |locale = 'en'|
            translations = public_send(attribute)
            translations[locale] || translations['en']
          end
        end

        def all
          @all ||= map_json_data(json_folder, self)
        end

        def add_to_all(custom_entries)
          @all = @all.merge(custom_entries.map do |data|
            [data['names']['en'], new(data)]
          end.to_h)
        end

        def find(name)
          all[name]
        end

        def find!(name)
          find(name) ||
            (raise NotFound, "#{name} (#{json_folder}) could not be found")
        end

        def reset!
          @all = nil
        end

        def where(conditions = {})
          all.values.select do |entry|
            conditions.all? do |name, value|
              if entry.public_send(name).is_a?(Array)
                entry.public_send(name).include?(value)
              else
                entry.public_send(name) == value
              end
            end
          end
        end

        private

        def map_json_data(type, klass)
          Hash[JSON.parse(File.read(json_data_path(type))).map do |_, data|
            [data['names']['en'], klass.new(data)]
          end]
        end

        def json_data_path(type)
          "#{Oakdex::Pokedex.data_dir}/#{type}.json"
        end
      end

      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def method_missing(method, *args, &block)
        if @attributes.key?(method.to_s)
          @attributes[method.to_s]
        else
          super
        end
      end
    end
  end
end
