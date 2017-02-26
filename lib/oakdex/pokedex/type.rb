module Oakdex
  module Pokedex
    class Type
      def initialize(attributes)
        @attributes = attributes
      end

      def name(locale = 'en')
        @attributes['names'][locale] || @attributes['names']['en']
      end

      def effectivness_for(other_type)
        @attributes['effectivness'][other_type]
      end
    end
  end
end
