require 'spec_helper'
require 'json-schema'

describe 'types' do
  Dir['data/schemas/*.json'].each do |schema_path|
    type = schema_path.sub('.json', '').split('/').last
    Dir["data/#{type}/*.json"].each do |file_name|
      it "#{file_name} follows schema" do
        expect(JSON::Validator.validate!("data/schemas/#{type}.json", file_name))
          .to be(true)
      end
    end
  end
end
