require 'ostruct'

module Oakdex
  module Pokedex
    class Base
      def self.translate(attribute, name)
        define_method(name) do |locale = 'en'|
          translations = @source.send(attribute)
          translations[locale] || translations['en']
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
