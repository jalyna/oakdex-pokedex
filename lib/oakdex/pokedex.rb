require 'oakdex/pokedex/type'

module Oakdex
  # Class that handles Pokedex Requests
  module Pokedex
    def self.types
      @types ||= Dir['data/types/*.json'].map do |file_name|
        data = JSON.parse(File.read(file_name))
        [data['names']['en'], Type.new(data)]
      end.to_h
    end

    def self.find_type(type)
      types[type]
    end
  end
end
