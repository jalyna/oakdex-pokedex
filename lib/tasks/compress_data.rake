require 'oakdex/pokedex'
require 'json/minify'

namespace :compress_data do
  task :run do
    %w[ability egg_group generation move nature pokemon type].each do |type|
      entries = Hash[Dir["#{Oakdex::Pokedex.data_dir}/#{type}/*.json"]
        .map do |file_name|
                       data = JSON.parse(File.read(file_name))
                       [data['names']['en'], data]
                     end]

      File.open("#{Oakdex::Pokedex.data_dir}/#{type}.json", 'w') do |file|
        file.write(JSON.minify(entries.to_json))
      end
    end
  end
end
