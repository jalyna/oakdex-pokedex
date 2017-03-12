# Pokedex Nature

The schema defines the following properties:

## `names` (object, required)

Properties of the `names` object:

### `cz` (string)

### `dk` (string)

### `fr` (string)

### `de` (string, required)

### `gr` (string)

### `it` (string)

### `pl` (string)

### `en` (string, required)

## `increased_stat` (string,null, enum, required)

This element must be one of the following enum values:

* `atk`
* `def`
* `sp_atk`
* `sp_def`
* `speed`
* `null`

## `decreased_stat` (string,null, enum, required)

This element must be one of the following enum values:

* `atk`
* `def`
* `sp_atk`
* `sp_def`
* `speed`
* `null`

## `favorite_flavor` (string,null, enum, required)

This element must be one of the following enum values:

* `Dry`
* `Spicy`
* `Sweet`
* `Bitter`
* `Sour`
* `null`

## `disliked_flavor` (string,null, enum, required)

This element must be one of the following enum values:

* `Dry`
* `Spicy`
* `Sweet`
* `Bitter`
* `Sour`
* `null`