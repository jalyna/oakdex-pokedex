# Change Log
All notable changes to this project will be documented in this file.
Please keep to the changelog format described on [keepachangelog.com](http://keepachangelog.com).

## [Unreleased]

### Changed
- Changed signature of all javascript functions: instead of `findPokemon('Eevee', fn)` it is now just `findPokemon('Eevee')` as it is now sync instead of async. More in #81

## Removed
- Removed Ruby 2.0.0 Support

### Fixed
- Added missing alolan base stats for 10 Pokémon: Diglett, Dugtrio, Exeggutor, Meowth, Ninetales, Persian, Raichu, Raticate, Sandshrew, Sandslash
- Reduced npm package to 23MB (from 69MB)
