'use strict';
const jsonValidate = require('jsonschema').validate

const POKEMON = require('../data/pokemon.json')
const MOVES = require('../data/move.json')
const ABILITIES = require('../data/ability.json')
const EGG_GROUPS = require('../data/egg_group.json')
const TYPES = require('../data/type.json')
const REGIONS = require('../data/region.json')
const GENERATIONS = require('../data/generation.json')
const NATURES = require('../data/nature.json')
const ITEMS = require('../data/item.json')

const POKEMON_SCHEMA = require('../data/schemas/pokemon.json')

let allPokemonByName = JSON.parse(JSON.stringify(POKEMON))
let allPokemonById = {}

const updateAllPokemonById = function() {
  allPokemonById = Object.values(allPokemonByName).reduce((map, data) => {
    map[data.national_id] = data;
    return map
  })
};

updateAllPokemonById();

var filterBy = function(list, conditions = {}) {
  if (Object.keys(conditions).length === 0) {
    return Object.values(list)
  }
  return Object.values(list).filter(function(item) {
    return Object.entries(conditions).find(function(pair) {
      const [attr, value] = pair
      if(attr === 'dex') {
        if(item[value + '_id']) {
          return true
        }
        return
      }
      if(item[attr] && Array.isArray(item[attr])) {
        if(item[attr].indexOf(value) > -1) {
          return true
        }
        return
      }
      if(item[attr] === value) {
        return true
      }
    })
  });
};

const customSchemaFor = function(pokemon) {
  let customSchema = Object.assign({}, POKEMON_SCHEMA)
  customSchema.properties.national_id.minimum = 10001
  delete customSchema.properties.national_id.maximum

  const availablePokemon = Object.keys(allPokemonByName).concat([null]).concat(pokemon.map(function(p) {
    return p.names && p.names.en ? p.names.en : null
  }))

  customSchema.definitions.pokemon.enum = availablePokemon
  return customSchema
};

const validatePokemon = function(pokemon) {
  const schema = customSchemaFor(pokemon)
  pokemon.map(function(p) {
    jsonValidate(p, schema, { throwError: true })
  })
};

module.exports = {

  importPokemon(customPokemon) {
    const pokemonList = Array.isArray(customPokemon) ? customPokemon : JSON.parse(customPokemon)
    const pokemon = pokemonList.map(function(p) {
      return (typeof p === 'string' ? JSON.parse(p) : p)
    })
    validatePokemon(pokemon)
    pokemon.map(function(p) {
      allPokemonByName[p.names.en] = p
    })
    updateAllPokemonById()
  },

  resetPokemon() {
    allPokemonByName = JSON.parse(JSON.stringify(POKEMON))
    allPokemonById = {}
    updateAllPokemonById()
  },

  findPokemon(idOrName) {
    return allPokemonById[idOrName] || allPokemonByName[idOrName] || null
  },

  findMove: function(name) {
    return MOVES[name] || null;
  },

  findAbility: function(name) {
    return ABILITIES[name] || null;
  },

  findType: function(name) {
    return TYPES[name] || null;
  },

  findRegion: function(name) {
    return REGIONS[name] || null;
  },

  findEggGroup: function(name) {
    return EGG_GROUPS[name] || null;
  },

  findGeneration: function(name) {
    return GENERATIONS[name] || null;
  },

  findNature: function(name) {
    return NATURES[name] || null;
  },

  findItem: function(name) {
    return ITEMS[name] || null;
  },

  allPokemon: function(conditions = {}) {
    if(conditions.type) {
      conditions.types = conditions.type;
    }
    if(conditions.egg_group) {
      conditions.egg_groups = conditions.egg_group;
    }
    return filterBy(allPokemonByName, conditions);
  },

  allMoves: function(conditions) {
    return filterBy(MOVES, conditions);
  },

  allItems: function(conditions) {
    return filterBy(ITEMS, conditions);
  },

  allAbilities: function(conditions) {
    return filterBy(ABILITIES, conditions);
  },

  allTypes: function(conditions) {
    return filterBy(TYPES, conditions);
  },

  allRegions: function(conditions) {
    return filterBy(REGIONS, conditions);
  },

  allEggGroups: function(conditions) {
    return filterBy(EGG_GROUPS, conditions);
  },

  allGenerations: function(conditions) {
    return filterBy(GENERATIONS, conditions);
  },

  allNatures: function(conditions) {
    return filterBy(NATURES, conditions);
  }
};
