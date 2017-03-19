# <img src="https://v20.imgup.net/oakdex_logfbad.png" alt="fixer" width=282>

[![Build Status](https://travis-ci.org/jalyna/oakdex-pokedex.svg?branch=master)](https://travis-ci.org/jalyna/oakdex-pokedex) [![Code Climate](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/gpa.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex) [![Test Coverage](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/coverage.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex/coverage) [![Issue Count](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/issue_count.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex)


## Getting Started

### Ruby

Add oakdex to your Gemfile and do `bundle install`:

```ruby
gem 'oakdex-pokedex'
```

Then you can use the library:

```ruby
require 'oakdex/pokedex'

eevee = Oakdex::Pokedex::Pokemon.find('Eevee')
# => #<Oakdex::Pokedex::Pokemon:0x007fe3dd6a88f8 @attributes={"names"=>{"fr"=>"Évoli", "de"=>"Evoli", "it"=>"Eevee", "en"=>"Eevee"}, "national_id"=>133 ...>

bulbasaur = Oakdex::Pokedex::Pokemon.find(1)
# => #<Oakdex::Pokedex::Pokemon:0x007fe3dc55da80 @attributes={"names"=>{"fr"=>"Bulbizarre", "de"=>"Bisasam", ...>

bulbasaur.name
# => "Bulbasaur"

bulbasaur.name('de')
# => "Bisasam"

bulbasaur.types
# => ["Grass", "Poison"]

bulbasaur.attributes
# => {"names"=>{"fr"=>"Bulbizarre", "de"=>"Bisasam", "it"=>"Bulbasaur", "en"=>"Bulbasaur"}, "national_id"=>1, "types"=>["Grass", "Poison"], "abilities"=>[{"name"=>"Overgrow"}, {"name"=>"Chlorophyll", "hidden"=>true}], "gender_ratios"=>{"male"=>87.5, "female"=>12.5}, "catch_rate"=>45, "egg_groups"=...}

tackle = Oakdex::Pokedex::Move.find('Tackle')
# => #<Oakdex::Pokedex::Move:0x007fbc9a10cda0 @attributes={"index_number"=>33, "pp"=>35, "max_pp"=>56, "power"=>50, "accuracy"=>100, "category"=>"physical", "priority"=>0, "target"=>"target", ...>

contrary = Oakdex::Pokedex::Ability.find('Contrary')
# => #<Oakdex::Pokedex::Ability:0x007fbc9b033540 @attributes={"index_number"=>126, "names"=>{"fr"=>"Contestation", "de"=>"Umkehrung", "it"=>"Inversione", "en"=>"Contrary"}, "descriptions"=>{"en"=>"Inverts stat modifiers.", "de"=>"Attacken, die einen Statuswert des Pokémon erhöhen würden, senken ihn und umgekehrt."}}>

fairy = Oakdex::Pokedex::Type.find('Fairy')
# => #<Oakdex::Pokedex::Type:0x007fbc9a943c30 @attributes={"names"=>{"de"=>"Fee", "gr"=>"νεράιδα Neraida", "it"=>"Folletto", "pl"=>"Baśniowy (XY13) Bajkowy (XY46)", "en"=>"Fairy"}, "effectivness"=>{"Normal"=>1.0, "Fighting"=>2.0, "Flying"=>1.0, "Poison"=>0.5, "Ground"=>1.0, "Rock"=>1.0, "Bug"=>1.0, "Ghost"=>1.0, "Steel"=>0.5, "Fire"=>0.5, "Water"=>1.0, "Grass"=>1.0, "Electric"=>1.0, "Psychic"=>1.0, "Ice"=>1.0, "Dragon"=>2.0, "Dark"=>2.0, "Fairy"=>1.0}, "color"=>"#D685AD"}>
fairy.effectivness_for('Dark')
# => 2.0

water1 = Oakdex::Pokedex::EggGroup.find('Water 1')
# => #<Oakdex::Pokedex::EggGroup:0x007fbc9a853398 @attributes={"names"=>{"en"=>"Water 1", "jp"=>"すいちゅう1 (水中1) Suichū1", "fr"=>"Eau 1", "de"=>"Wasser 1", "it"=>"Acqua 1", "es"=>"Agua 1"}}>

generation6 = Oakdex::Pokedex::Generation.find('Generation VI')
# => #<Oakdex::Pokedex::Generation:0x007fbc9b0382c0 @attributes={"number"=>6, "dex_name"=>"kalos_id", "names"=>{"en"=>"Generation VI", "de"=>"Generation VI"}, "games"=>[{"en"=>"X", "de"=>"X"}, {"en"=>"Y", "de"=>"Y"}, {"en"=>"Omega Ruby", "de"=>"Omega Rubin"}, {"en"=>"Alpha Sapphire", "de"=>"Alpha Saphir"}]}>

bold = Oakdex::Pokedex::Nature.find('Bold')
# => #<Oakdex::Pokedex::Nature:0x007fbc9a92b2c0 @attributes={"names"=>{"en"=>"Bold", "de"=>"Kühn"}, "increased_stat"=>"def", "decreased_stat"=>"atk", "favorite_flavor"=>"Sour", "disliked_flavor"=>"Spicy"}>


Oakdex::Pokedex::Pokemon.all.size
# => 802
Oakdex::Pokedex::Pokemon.where(type: 'Dark').size
# => 46
Oakdex::Pokedex::Pokemon.where(egg_group: 'Human-Like').size
# => 52
Oakdex::Pokedex::Pokemon.where(dex: 'alola').size
# => 302
Oakdex::Pokedex::Pokemon.where(alola_id: 1)
# => [#<Oakdex::Pokedex::Pokemon:0x007fbc9e542510 @attributes={"names"=>{"en"=>"Rowlet", "jp"=>"モクロー Mokuroh", "fr"=>"Brindibou", "es"=>"Rowlet", "de"=>"Bauz", "it"=>"Rowlet"}, "national_id"=>722, "alola_id"=>1, ...>]

Oakdex::Pokedex::Move.where(type: 'Ground').size
# => 26
```


### Javascript

Install the package:

```
$ npm install oakdex-pokedex --save
```

Then you can use the library:

```js
oakdexPokedex = require('oakdex-pokedex');

oakdexPokedex.findPokemon('Eevee', function(p) {
  // returns data/pokemon/eevee.json
  console.log(p.names.en); // Eeevee
});

oakdexPokedex.findPokemon(4, function(p) {
  // returns data/pokemon/charmander.json
  console.log(p.names.en); // Charmander
});

oakdexPokedex.findMove('Tackle', function(m) {
  // returns data/move/tackle.json
  console.log(m.names.en); // Tackle
});

oakdexPokedex.findAbility('Contrary', function(a) {
  // returns data/ability/contrary.json
  console.log(a.names.en); // Contrary
});

oakdexPokedex.findType('Fairy', function(t) {
  // returns data/type/fairy.json
  console.log(t.names.en); // Fairy
});

oakdexPokedex.findEggGroup('Water 1', function(e) {
  // returns data/egg_group/water_1.json
  console.log(e.names.en); // Water 1
});

oakdexPokedex.findGeneration('Generation VI', function(g) {
  // returns data/generation/6.json
  console.log(g.names.en); // Generation VI
});

oakdexPokedex.findNature('Bold', function(n) {
  // returns data/nature/bold.json
  console.log(n.names.en); // Bold
});


oakdexPokedex.allPokemon(function(pokemon) {
  console.log(pokemon.length); // 802
});

oakdexPokedex.allPokemon({ type: 'Dark' }, function(pokemon) {
  console.log(pokemon.length); // 46
});

oakdexPokedex.allPokemon({ egg_group: 'Human-Like' }, function(pokemon) {
  console.log(pokemon.length); // 52
});

oakdexPokedex.allPokemon({ dex: 'alola' }, function(pokemon) {
  console.log(pokemon.length); // 302
});

oakdexPokedex.allMoves({ type: 'Ground' }, function(moves) {
  console.log(moves.length); // 26
});
```


### Schemas

If you want to know what the structure of the given data is, checkout the following documentations:

- [Pokemon](doc/pokemon.md)
- [Move](doc/move.md)
- [Ability](doc/ability.md)
- [Type](doc/type.md)
- [Egg Group](doc/egg_group.md)
- [Nature](doc/nature.md)
- [Generation](doc/generation.md)


### Sprites

If you want also to include sprites in your pokedex, check out [oakdex-pokedex-sprites](https://github.com/jalyna/oakdex-pokedex-sprites).

## Contributing

I would be happy if you want to add your contribution to the project. In order to contribute, you just have to fork this repository.

## License

MIT License. See the included MIT-LICENSE file.

## Credits

Logo Icon by [Roundicons Freebies](http://www.flaticon.com/authors/roundicons-freebies).
