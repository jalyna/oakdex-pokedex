# Pokemon Generation

The schema defines the following properties:

## `number` (integer, required)

Additional restrictions:

* Minimum: `1`
* Maximum: `7`

## `dex_name` (string, required)

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

### `es` (string)

### `jp` (string)

## `games` (array, required)

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `cz` (string)

### `dk` (string)

### `fr` (string)

### `de` (string)

### `gr` (string)

### `it` (string)

### `pl` (string)

### `en` (string, required)

### `es` (string)

### `jp` (string)

Additional restrictions:

* Minimum items: `1`