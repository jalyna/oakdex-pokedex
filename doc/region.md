# Pokemon

The schema defines the following properties:

## `names` (translations, required)

## `locations` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `names` (translations, required)

### `pokemon` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

#### `pokemon` (pokemon, required)

#### `variation` (string, enum)

This element must be one of the following enum values:

* `Alolan Rattata`
* `Alolan Meowth`
* `Alolan Grimer`
* `Alolan Diglett`
* `Alolan Raticate`
* `Alolan Geodude`
* `Alolan Graveler`
* `Alolan Vulpix`
* `Alolan Sandshrew`
* `Alolan Exeggutor`
* `Alolan Dugtrio`
* `Alolan Persian`
* `Super Size`
* `Average Size`
* `Large Size`
* `Pa'u Style`
* `Pom-Pom Style`
* `Sensu Style`
* `Midnight Form`

#### `location` (string, enum, required)

This element must be one of the following enum values:

* `Walking`
* `Surfing`
* `Trade`
* `Gift`
* `Interact`
* `Super Rod`
* `Headbutt`
* `Honey Tree`
* `Berry Piles`

#### `min_level` (integer, required)

Additional restrictions:

* Maximum: `100`

#### `max_level` (integer, required)

Additional restrictions:

* Maximum: `100`

#### `rarity` (string, enum, required)

This element must be one of the following enum values:

* `common`
* `uncommon`
* `rare`
* `limited`

#### `games` (array, required)

The object is an array with all elements of the type `string`.

Additional restrictions:

* Minimum items: `1`

#### `day_times` (array)

The object is an array with all elements of the type `string`.

Additional restrictions:

* Minimum items: `1`

#### `seasons` (array)

The object is an array with all elements of the type `string`.

Additional restrictions:

* Minimum items: `1`

---

# Sub Schemas

The schema defines the following additional types:

## `pokemon` (string,null)

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