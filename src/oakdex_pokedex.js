'use strict';
const POKEMON_BY_NAME = require('../data/pokemon.json')
const POKEMON_BY_ID = Object.values(POKEMON_BY_NAME).reduce((map, data) => {
  map[data.national_id] = data;
  return map
})

const MOVES = require('../data/move.json')
const ABILITIES = require('../data/ability.json')
const EGG_GROUPS = require('../data/egg_group.json')
const TYPES = require('../data/type.json')
const REGIONS = require('../data/region.json')
const GENERATIONS = require('../data/generation.json')
const NATURES = require('../data/nature.json')

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

module.exports = {

  findPokemon(idOrName) {
    return POKEMON_BY_ID[idOrName] || POKEMON_BY_NAME[idOrName] || null
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

  allPokemon: function(conditions = {}) {
    if(conditions.type) {
      conditions.types = conditions.type;
    }
    if(conditions.egg_group) {
      conditions.egg_groups = conditions.egg_group;
    }
    return filterBy(POKEMON_BY_NAME, conditions);
  },

  allMoves: function(conditions) {
    return filterBy(MOVES, conditions);
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
