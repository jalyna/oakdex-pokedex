# <img src="https://v20.imgup.net/oakdex_logfbad.png" alt="fixer" width=282>

[![Gem Version](https://badge.fury.io/rb/oakdex-pokedex.svg)](https://badge.fury.io/rb/oakdex-pokedex) [![npm version](https://badge.fury.io/js/oakdex-pokedex.svg)](https://badge.fury.io/js/oakdex-pokedex) [![Build Status](https://travis-ci.org/jalyna/oakdex-pokedex.svg?branch=master)](https://travis-ci.org/jalyna/oakdex-pokedex) [![Code Climate](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/gpa.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex) [![Test Coverage](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/coverage.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex/coverage) [![Issue Count](https://codeclimate.com/github/jalyna/oakdex-pokedex/badges/issue_count.svg)](https://codeclimate.com/github/jalyna/oakdex-pokedex)


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

potion = Oakdex::Pokedex::Item.find('Potion')
# => #<Oakdex::Pokedex::Item:0x007fd48f1b14b0 @attributes={"names"=>{"en"=>"Potion", "de"=>"Trank", "fr"=>"Potion, ...>

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
# => 809
Oakdex::Pokedex::Pokemon.where(type: 'Dark').size
# => 46
Oakdex::Pokedex::Pokemon.where(egg_group: 'Human-Like').size
# => 52
Oakdex::Pokedex::Pokemon.where(dex: 'alola').size
# => 307
Oakdex::Pokedex::Pokemon.where(alola_id: 1)
# => [#<Oakdex::Pokedex::Pokemon:0x007fbc9e542510 @attributes={"names"=>{"en"=>"Rowlet", "jp"=>"モクロー Mokuroh", "fr"=>"Brindibou", "es"=>"Rowlet", "de"=>"Bauz", "it"=>"Rowlet"}, "national_id"=>722, "alola_id"=>1, ...>]

Oakdex::Pokedex::Move.where(type: 'Ground').size
# => 26

Oakdex::Pokedex::Item.all.size
# => 69, still WIP

Oakdex::Pokedex::Item.where(category: 'Potion').size
# => 5
```


### Javascript

Install the package:

```
$ npm install oakdex-pokedex --save
```

Then you can use the library:

```js
oakdexPokedex = require('oakdex-pokedex');

const eevee = oakdexPokedex.findPokemon('Eevee')
// returns data/pokemon/eevee.json
console.log(eevee.names.en); // Eeevee

const charmander = oakdexPokedex.findPokemon(4)
// returns data/pokemon/charmander.json
console.log(charmander.names.en); // Charmander

const tackle = oakdexPokedex.findMove('Tackle')
// returns data/move/tackle.json
console.log(m.names.en); // Tackle

const potion = oakdexPokedex.findItem('Potion')
// returns data/item/potion.json
console.log(m.names.en); // Potion

const contrary = oakdexPokedex.findAbility('Contrary')
// returns data/ability/contrary.json
console.log(a.names.en); // Contrary

const fairy = oakdexPokedex.findType('Fairy')
// returns data/type/fairy.json
console.log(fairy.names.en); // Fairy

const water1 = oakdexPokedex.findEggGroup('Water 1')
// returns data/egg_group/water_1.json
console.log(water1.names.en); // Water 1

const genVI = oakdexPokedex.findGeneration('Generation VI')
// returns data/generation/6.json
console.log(genVI.names.en); // Generation VI

const bold = oakdexPokedex.findNature('Bold')
// returns data/nature/bold.json
console.log(bold.names.en); // Bold

const allPokemon = oakdexPokedex.allPokemon()
console.log(allPokemon.length); // 809

const allItems = oakdexPokedex.allItems()
console.log(allItems.length); // 69, WIP

const darkPokemon = oakdexPokedex.allPokemon({ type: 'Dark' })
console.log(darkPokemon.length); // 46

const humanLike = oakdexPokedex.allPokemon({ egg_group: 'Human-Like' })
console.log(humanLike.length); // 52

const alola = oakdexPokedex.allPokemon({ dex: 'alola' })
console.log(alola.length); // 302

const moves = oakdexPokedex.allMoves({ type: 'Ground' })
console.log(moves.length); // 26
```


### Add custom Pokemon / Fakemon

You can add your own Pokémon and it will be checked if it is valid. You can and should add them as a batch as evolutions need to present at the same time.

Fakemon need to have a national_id that is greater than 10000.

Checkout [the fakemon examples](fixtures).

```rb
fakemon_stage1 = File.read('my_fakemon1.json')
fakemon_stage2 = File.read('my_fakemon2.json')

Oakdex::Pokedex::Pokemon.import!([fakemon_stage1, fakemon_stage2])

Oakdex::Pokedex::Pokemon.find('My Fakemon')
```

```js
fakemonStage1 = fs.readFileSync('./fixtures/my_fakemon1.json', 'utf8')
fakemonStage2 = fs.readFileSync('./fixtures/my_fakemon2.json', 'utf8')

oakdexPokedex.importPokemon([fakemonStage1, fakemonStage2])

oakdexPokedex.findPokemon('My Fakemon')
```


### Schemas

If you want to know what the structure of the given data is, checkout the following documentations:

- [Pokemon](doc/pokemon.md)
- [Item](doc/item.md)
- [Move](doc/move.md)
- [Ability](doc/ability.md)
- [Type](doc/type.md)
- [Egg Group](doc/egg_group.md)
- [Nature](doc/nature.md)
- [Generation](doc/generation.md)
- [Region](doc/region.md)


### Sprites

If you want also to include sprites in your pokedex, check out [oakdex-pokedex-sprites](https://github.com/jalyna/oakdex-pokedex-sprites).

## Contributing

I would be happy if you want to add your contribution to the project. In order to contribute, you just have to fork this repository.

Please respect the [Code of Conduct](//github.com/jalyna/oakdex-pokedex/blob/master/CODE_OF_CONDUCT.md).

### Minify json files before releasing new version:

```
$ rake compress_data:run
```

## License

MIT License. See the included MIT-LICENSE file.

## Credits

Logo Icon by [Roundicons Freebies](http://www.flaticon.com/authors/roundicons-freebies).
