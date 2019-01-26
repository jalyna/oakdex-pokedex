# Change Log
All notable changes to this project will be documented in this file.
Please keep to the changelog format described on [keepachangelog.com](http://keepachangelog.com).

## [Unreleased]

### Added
- Added Revive and Max Revive
- Added all 9 Vitamins
- Added 13 Status condition healing items

## [0.4.1] - 2019-01-22

### Added
- Added Item schema and type for gem and npm package
- Added all 5 potion items


## [0.4.0] - 2019-01-20

### Added
- Added `Oakdex::Pokedex::Pokemon.import!([json1, json2])` to ruby gem in order to add custom pokemon.
- Added `importPokemon([json1, json2])` to npm package


## [0.3.0] - 2019-01-06

### Changed
- Changed signature of all javascript functions: instead of `findPokemon('Eevee', fn)` it is now just `findPokemon('Eevee')` as it is now sync instead of async. More in #81

### Removed
- Removed Ruby 2.0.0 Support

### Fixed
- Added missing alolan base stats for 10 Pokémon: Diglett, Dugtrio, Exeggutor, Meowth, Ninetales, Persian, Raichu, Raticate, Sandshrew, Sandslash
- Reduced npm package to 23MB (from 69MB)
