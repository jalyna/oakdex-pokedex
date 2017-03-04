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
            translations = @source.send(attribute)
            translations[locale] || translations['en']
          end
        end

        def all
          @all ||= map_json_data(json_folder, self)
        end

        def find(name)
          all[name]
        end

        private

        def map_json_data(type, klass)
          Hash[Dir["data/#{type}/*.json"].map do |file_name|
            data = JSON.parse(File.read(file_name))
            [data['names']['en'], klass.new(data)]
          end]
        end
      end

      def initialize(attributes)
        @source = OpenStruct.new(attributes)
      end

      def method_missing(method, *args, &block)
        @source.send(method, *args, &block)
      end
    end
  end
end
