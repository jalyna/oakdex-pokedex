# Move

The schema defines the following properties:

## `names` (translations, required)

## `pokedex_entries` (object, required)

## `index_number` (integer, required)

## `pp` (integer, required)

Additional restrictions:

* Maximum: `40`

## `max_pp` (integer, required)

Additional restrictions:

* Maximum: `64`

## `power` (integer, required)

Additional restrictions:

* Maximum: `250`

## `accuracy` (integer, required)

Additional restrictions:

* Maximum: `100`

## `type` (type, required)

## `category` (string, enum, required)

This element must be one of the following enum values:

* `physical`
* `status`
* `special`
* `varies`

## `priority` (integer, required)

Additional restrictions:

* Minimum: `-7`
* Maximum: `7`

## `target` (string, enum, required)

This element must be one of the following enum values:

* `target_adjacent_single`
* `target_adjacent_user_single`
* `target_user_or_adjacent_user`
* `user`
* `all_users`
* `all_adjacent`
* `adjacent_foes_all`
* `all_except_user`
* `all_foes`
* `all`
* `user_and_random_adjacent_foe`

## `critical_hit` (integer, required)

Additional restrictions:

* Maximum: `2`

## `makes_contact` (boolean, required)

## `affected_by_protect` (boolean, required)

## `affected_by_magic_coat` (boolean, required)

## `affected_by_snatch` (boolean, required)

## `affected_by_mirror_move` (boolean, required)

## `affected_by_kings_rock` (boolean, required)

## `in_battle_properties` (object)

Properties of the `in_battle_properties` object:

### `increased_critical_hit_ratio` (boolean)

### `status_conditions` (array)

The object is an array with all elements of the type `object`.

The array object has the following properties:

#### `condition` (string, enum, required)

This element must be one of the following enum values:

* `burn`
* `freeze`
* `paralysis`
* `poison`
* `badly_poisoned`
* `sleep`

#### `probability` (integer, required)

Additional restrictions:

* Maximum: `100`

## `stat_modifiers` (array)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `stat` (string, enum, required)

This element must be one of the following enum values:

* `random`
* `atk`
* `def`
* `speed`
* `sp_atk`
* `sp_def`
* `accuracy`
* `evasion`
* `critital_hit`

### `change_by` (integer, required)

Additional restrictions:

* Minimum: `-12`
* Maximum: `12`

### `affects_user` (boolean)

## `contests` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `contest` (string, enum, required)

This element must be one of the following enum values:

* `Contests`
* `Super Contests`
* `Contest Spectaculars`

### `condition` (string, enum, required)

This element must be one of the following enum values:

* `Tough`
* `Cute`
* `Clever`
* `Cool`
* `Beautiful`

### `appeal` (integer, required)

Additional restrictions:

* Maximum: `8`

### `jam` (integer, required)

Additional restrictions:

* Maximum: `5`

---

# Sub Schemas

The schema defines the following additional types:

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

## `type` (string)