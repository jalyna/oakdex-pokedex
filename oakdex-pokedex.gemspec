Gem::Specification.new do |s|
  s.name        = 'oakdex-pokedex'
  s.version     = '0.0.0'
  s.summary     = 'Pokedex for Gen 1-7'
  s.description = 'Pokedex for Gen 1-7, in JSON and accessible through Ruby.'
  s.authors     = ['Jalyna Schroeder']
  s.email       = 'jalyna.schroeder@gmail.com'
  s.files       = Dir.glob('lib/**/**') + Dir.glob('data/**/**') + %w(README.md)
  s.homepage    = 'http://github.com/jalyna/oakdex-pokedex'
  s.license     = 'MIT'
end
