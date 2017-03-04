require 'json'
require 'oakdex/pokedex/type'
require 'oakdex/pokedex/nature'

module Oakdex
  # Class that handles Pokedex Requests
  module Pokedex
    class << self
      def types
        @types ||= map_json_data('type', Type)
      end

      def find_type(name)
        types[name]
      end

      def natures
        @natures ||= map_json_data('nature', Nature)
      end

      def find_nature(name)
        natures[name]
      end

      private

      def map_json_data(type, klass)
        Dir["data/#{type}/*.json"].map do |file_name|
          data = JSON.parse(File.read(file_name))
          [data['names']['en'], klass.new(data)]
        end.to_h
      end
    end
  end
end
