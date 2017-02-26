require 'spec_helper'
require 'json-schema'

describe 'types' do
  Dir['data/types/*.json'].each do |file_name|
    it "#{file_name} follows schema" do
      expect(JSON::Validator.validate('data/schemas/type.json', file_name))
        .to be(true)
    end
  end
end
