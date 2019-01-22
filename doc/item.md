# Item

The schema defines the following properties:

## `names` (translations, required)

## `category` (string, enum, required)

This element must be one of the following enum values:

* `Evolutionary stones`
* `Repels`
* `Fossils`
* `Flutes`
* `Shards`
* `Held items`
* `Escape items`
* `Escape Rope`
* `Exchangeable items`
* `Valuable items`
* `Battle items`
* `Bottle Caps`
* `Legendary artifacts`
* `Honey`
* `Scents`
* `Nectars`
* `Potions`
* `Status condition healing items`
* `Revives`
* `PP-restoring items`
* `Vitamins`
* `Wings`
* `Drinks`
* `Herbal medicine`
* `Ability Capsule`
* `Berries`
* `Mulch`
* `Apricorns`
* `Poké Balls`
* `Decorations`
* `Accessoiries`
* `Backdrops`
* `Props`
* `Décor`
* `Clothing`
* `Fashion items`
* `Mail`
* `Key Items`
* `Event items`
* `Wood boxes`
* `Time Flute`
* `Pass Orbs`
* `Wonder Launcher items`
* `Rotom Powers`

## `descriptions` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `games` (games, required)

### `translations` (translations, required)

Additional restrictions:

* Minimum items: `1`

## `prices` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `games` (games, required)

### `buying` (integer, required)

Additional restrictions:

* Maximum: `10000`

### `selling` (integer, required)

Additional restrictions:

* Maximum: `10000`

## `pockets` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `pocket` (pocket, required)

### `generations` (array, required)

The object is an array with all elements of the type `generation`.

## `effects` (array, required)

The object is an array with all elements of the type `effect`.

## `fling_power` (integer, required)

Additional restrictions:

* Maximum: `150`

---

# Sub Schemas

The schema defines the following additional types:

## `effect` (object)

Properties of the `effect` object:

### `condition` (string, enum, required)

This element must be one of the following enum values:

* `During Battle`
* `Outside of Battle`
* `Always`

### `target` (string, enum, required)

This element must be one of the following enum values:

* `Single Pokémon`
* `Team`
* `Trainer`

### `pokemon_changes` (array)

The object is an array with all elements of the type `object`.

The array object has the following properties:

#### `field` (string, enum, required)

This element must be one of the following enum values:

* `current_hp`
* `status_condition`

#### `change_by_percent` (integer)

Additional restrictions:

* Minimum: `-100`
* Maximum: `100`

#### `change_by` (integer)

Additional restrictions:

* Minimum: `-10000`
* Maximum: `10000`

#### `change` (string, enum)

This element must be one of the following enum values:

* `remove`

#### `conditions` (array)

The object is an array with all elements of the type `string`.

Additional restrictions:

* Minimum items: `1`

Additional restrictions:

* Minimum items: `1`

## `games` (array)

## `pocket` (string)

## `generation` (integer)

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