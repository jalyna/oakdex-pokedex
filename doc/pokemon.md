# Pokemon

The schema defines the following properties:

## `names` (translations, required)

## `national_id` (integer, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `802`

## `kanto_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `151`

## `johto_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `256`

## `hoenn_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `211`

## `sinnoh_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `210`

## `unova_id` (integer,null, required)

Additional restrictions:

* Maximum: `155`

## `kalos_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `153`

## `alola_id` (integer,null, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `302`

## `categories` (translations, required)

## `pokedex_entries` (object, required)

## `evolution_from` (pokemon, required)

## `evolutions` (array, required)

The object is an array with all elements of the type `evolution`.

## `types` (array, required)

The object is an array with all elements of the type `type`.

Additional restrictions:

* Minimum items: `1`

## `abilities` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `name` (ability, required)

### `hidden` (boolean)

Additional restrictions:

* Minimum items: `1`

## `gender_ratios` (object,null, required)

## `catch_rate` (integer, required)

Additional restrictions:

* Maximum: `255`

## `egg_groups` (array, required)

The object is an array with all elements of the type `egg_group`.

Additional restrictions:

* Minimum items: `1`

## `hatch_time` (array, required)

The object is an array with all elements of the type `integer`.

Additional restrictions:

* Minimum items: `2`

## `height_us` (string, required)

Height in inch e.g. 32'20"

Additional restrictions:

* Regex pattern: `^[0-9]{1,3}'[0-9]{2}"$`

## `height_eu` (string, required)

Height in metres e.g. 2.3 m

Additional restrictions:

* Regex pattern: `^[0-9]{1,2}.[0-9]{1} m$`

## `weight_us` (string, required)

Weight in lbs e.g. 200.3 lbs.

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} lbs.$`

## `weight_eu` (string, required)

Weight in kg e.g. 200.5 kg

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} kg$`

## `base_exp_yield` (integer, required)

Additional restrictions:

* Maximum: `608`

## `leveling_rate` (string, enum, required)

This element must be one of the following enum values:

* `Fast`
* `Medium Fast`
* `Medium Slow`
* `Slow`
* `Fluctuating`
* `Erratic`

## `ev_yield` (ev_yield, required)

## `color` (string, enum, required)

This element must be one of the following enum values:

* `Pink`
* `Green`
* `Blue`
* `Purple`
* `Gray`
* `Brown`
* `Black`
* `Yellow`
* `White`
* `Red`

## `base_friendship` (integer, required)

Additional restrictions:

* Maximum: `255`

## `base_stats` (base_stats, required)

## `pokeathlon_stats` (pokeathlon_stats)

## `learnset` (array, required)

The object is an array with all elements of the type `move_learnset`.

## `mega_evolutions` (array, required)

List of possible mega evolutions, if available. Charizard e.g. has two.

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `types` (array, required)

The object is an array with all elements of the type `type`.

Additional restrictions:

* Minimum items: `1`

### `ability` (ability, required)

### `height_us` (string, required)

Additional restrictions:

* Regex pattern: `^[0-9]{1,3}'[0-9]{2}"$`

### `height_eu` (string, required)

Additional restrictions:

* Regex pattern: `^[0-9]{1,2}.[0-9]{1} m$`

### `weight_us` (string, required)

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} lbs.$`

### `weight_eu` (string, required)

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} kg$`

### `base_stats` (base_stats, required)

### `mega_stone` (string, required)

### `image_suffix` (string)

Suffix used in oakdex-pokedex-sprites

## `variation_names` (translations)

## `variations` (array, required)

Pokemon that can change their form (e.g. Deoxys) otherwise always empty

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `condition` (string, enum)

This element must be one of the following enum values:

* `harsh sunlight`
* `rain`
* `hail`
* `Pokémon FireRed`
* `Pokémon LeafGreen`
* `Pokémon Emerald`
* `Battled in Cave or Beach`
* `Battled in Building`
* `Sandy Cloak of Burmy`
* `Trash Cloak of Burmy`
* `East Sea`
* `possesses microwave oven`
* `possesses washing machine`
* `possesses refrigerator`
* `possesses electric fan`
* `possesses lawnmower`
* `holding Griseous Orb or in Distortion World`
* `using Gracidea flower`
* `holding Plate or Z-Crystal`
* `Inherited or found by surfing`
* `using Zen Mode`
* `Summer`
* `Winter`
* `Autumn`
* `using Reveal Glass`
* `using DNA Splicers`
* `learning Secret Sword`
* `using Relic Song`
* `holding Drive`
* `using Battle Bond`
* `Player's Location`
* `Paris Event`
* `GTS 100 millionth trade Event`
* `Inherited or holding Flower`
* `groomed`
* `using damaging move`
* `Inherited or Random`
* `in battle`
* `using Prison Bottle`
* `using Nectar`
* `Pokémon Moon`
* `Level 20 and using Schooling`
* `holding Memory`
* `using Shields Down`
* `when receiving damage`
* `using Sunsteel Strike`
* `using Moongeist Beam`
* `female`

### `names` (translations, required)

### `types` (array, required)

The object is an array with all elements of the type `type`.

Additional restrictions:

* Minimum items: `1`

### `height_us` (string)

Additional restrictions:

* Regex pattern: `^[0-9]{1,3}'[0-9]{2}"$`

### `height_eu` (string)

Additional restrictions:

* Regex pattern: `^[0-9]{1,2}.[0-9]{1} m$`

### `weight_us` (string)

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} lbs.$`

### `weight_eu` (string)

Additional restrictions:

* Regex pattern: `^[0-9]{1,4}.[0-9]{1} kg$`

### `base_stats` (base_stats)

### `pokeathlon_stats` (pokeathlon_stats)

### `ev_yield` (ev_yield)

### `abilities` (array)

The object is an array with all elements of the type `object`.

The array object has the following properties:

#### `name` (ability, required)

#### `hidden` (boolean)

Additional restrictions:

* Minimum items: `1`

### `image_suffix` (string)

Suffix used in oakdex-pokedex-sprites

---

# Sub Schemas

The schema defines the following additional types:

## `pokemon` (string,null)

## `move` (string)

## `ability` (string)

## `egg_group` (string)

## `type` (string)

## `base_stats` (object)

Properties of the `base_stats` object:

### `hp` (integer, required)

Additional restrictions:

* Maximum: `255`

### `atk` (integer, required)

Additional restrictions:

* Maximum: `255`

### `def` (integer, required)

Additional restrictions:

* Maximum: `255`

### `sp_atk` (integer, required)

Additional restrictions:

* Maximum: `255`

### `sp_def` (integer, required)

Additional restrictions:

* Maximum: `255`

### `speed` (integer, required)

Additional restrictions:

* Maximum: `255`

## `ev_yield` (object)

Properties of the `ev_yield` object:

### `hp` (integer, required)

Additional restrictions:

* Maximum: `3`

### `atk` (integer, required)

Additional restrictions:

* Maximum: `3`

### `def` (integer, required)

Additional restrictions:

* Maximum: `3`

### `sp_atk` (integer, required)

Additional restrictions:

* Maximum: `3`

### `sp_def` (integer, required)

Additional restrictions:

* Maximum: `3`

### `speed` (integer, required)

Additional restrictions:

* Maximum: `3`

## `translations` (object)

Properties of the `translations` object:

### `cz` (string)

### `dk` (string)

### `fr` (string)

### `de` (string, required)

### `gr` (string)

### `it` (string)

### `pl` (string)

### `tr` (string)

### `en` (string, required)

### `jp` (string)

### `es` (string)

## `evolution` (object)

Properties of the `evolution` object:

### `to` (pokemon, required)

### `level` (integer)

Additional restrictions:

* Maximum: `100`

### `happiness` (boolean)

### `trade` (boolean)

### `level_up` (boolean)

### `item` (string, enum)

This element must be one of the following enum values:

* `Leaf Stone`
* `Fire Stone`
* `Shiny Stone`
* `Sun Stone`
* `Water Stone`
* `Dawn Stone`
* `Moon Stone`
* `Thunderstone`
* `Dusk Stone`

### `hold_item` (string, enum)

This element must be one of the following enum values:

* `Whipped Dream`
* `Sachet`
* `King's Rock`
* `Karrablast`
* `Dragon Scale`
* `Metal Coat`
* `Protector`
* `Dubious Disc`
* `Up-Grade`
* `Magmarizer`
* `Shelmet`
* `Prism Scale`
* `Electrizer`
* `Reaper Cloth`
* `Deepseatooth`
* `Deepseascale`
* `Razor Fang`
* `Oval Stone`
* `Razor Claw`

### `move_learned` (move)

### `conditions` (array)

The object is an array with all elements of the type `string`.

## `move_learnset` (object)

Properties of the `move_learnset` object:

### `parent` (pokemon)

### `move` (move, required)

### `level` (integer)

Additional restrictions:

* Maximum: `100`

### `tm` (string)

### `item_on_parent` (string, enum)

This element must be one of the following enum values:

* `Light Ball`

### `variations` (array)

The object is an array with all elements of the type `string`.

## `pokeathlon_stats` (object)

Hash includes the 5 different stats speed, power stamina, skill and jump. Each of them has the current and the maximum.