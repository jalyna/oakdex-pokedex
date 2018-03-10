# Move

The schema defines the following properties:

## `names` (translations, required)

## `descriptions` (translations, required)

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

* `target`
* `all_adjacent_foes`
* `all_foes`
* `user`
* `anyone_but_user`
* `user_and_adjacent_ally`
* `user_and_allies`
* `adjacent_ally`
* `all_adjacent`
* `everyone`
* `target_foe`

## `critical_hit` (integer, required)

Additional restrictions:

* Maximum: `2`

## `makes_contact` (boolean, required)

## `affected_by_protect` (boolean, required)

## `affected_by_magic_coat` (boolean, required)

## `affected_by_snatch` (boolean, required)

## `affected_by_mirror_move` (boolean, required)

## `affected_by_kings_rock` (boolean, required)

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