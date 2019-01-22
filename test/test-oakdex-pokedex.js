'use strict';
const oakdexPokedex = require('../src/oakdex_pokedex');
const expect = require('expect.js');
const fs = require('fs');
const jsonschema = require('jsonschema');

describe('OakdexPokedex', function() {
  beforeEach(function() {
    oakdexPokedex.resetPokemon()
  })

  describe('#importPokemon', function() {
    it('imports custom pokemon', function() {
      const fakemon1 = fs.readFileSync('./fixtures/fakemon1.json', 'utf8')
      const fakemon2 = fs.readFileSync('./fixtures/fakemon2.json', 'utf8')
      expect(oakdexPokedex.findPokemon('Fakemon1')).to.equal(null)
      expect(oakdexPokedex.findPokemon('Fakemon2')).to.equal(null)
      oakdexPokedex.importPokemon([fakemon1, fakemon2])
      expect(oakdexPokedex.findPokemon('Fakemon1')).not.to.equal(null)
      expect(oakdexPokedex.findPokemon('Fakemon2')).not.to.equal(null)
      expect(oakdexPokedex.allPokemon().length).to.equal(809)
    })

    it('imports custom pokemon by object', function() {
      const fakemon1 = JSON.parse(fs.readFileSync('./fixtures/fakemon1.json', 'utf8'))
      const fakemon2 = JSON.parse(fs.readFileSync('./fixtures/fakemon2.json', 'utf8'))
      expect(oakdexPokedex.findPokemon('Fakemon1')).to.equal(null)
      expect(oakdexPokedex.findPokemon('Fakemon2')).to.equal(null)
      oakdexPokedex.importPokemon([fakemon1, fakemon2])
      expect(oakdexPokedex.findPokemon('Fakemon1')).not.to.equal(null)
      expect(oakdexPokedex.findPokemon('Fakemon2')).not.to.equal(null)
      expect(oakdexPokedex.allPokemon().length).to.equal(809)
    })

    it('throws error when national id is lower than 10001', function() {
      const fakemon1 = JSON.parse(fs.readFileSync('./fixtures/fakemon1.json', 'utf8'))
      const fakemon2 = JSON.parse(fs.readFileSync('./fixtures/fakemon2.json', 'utf8'))
      fakemon1.national_id = 150
      expect(oakdexPokedex.importPokemon).withArgs([fakemon1, fakemon2]).to.throwException(function (e) { // get the exception object
        expect(e.message).to.equal('must have a minimum value of 10001');
      });
      expect(oakdexPokedex.findPokemon('Fakemon1')).to.equal(null)
      expect(oakdexPokedex.findPokemon('Fakemon2')).to.equal(null)
      expect(oakdexPokedex.allPokemon().length).to.equal(807)
    })
  })

  describe('#findPokemon', function() {
    it('finds eevee by name', function(done) {
      const pkmn = oakdexPokedex.findPokemon('Eevee')
      fs.readFile('./data/pokemon/eevee.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(pkmn.names.de).to.equal('Evoli');
        expect(pkmn).to.eql(obj);
        done();
      });
    });

    it('finds charmander by id', function(done) {
      const pkmn = oakdexPokedex.findPokemon(4)
      fs.readFile('./data/pokemon/charmander.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(pkmn.names.de).to.equal('Glumanda');
        expect(pkmn).to.eql(obj);
        done();
      });
    });

    it('returns null if pokemon does not exist', function(done) {
      expect(oakdexPokedex.findPokemon('NotKnownByMe')).to.equal(null);
      done()
    });
  });

  describe('#findMove', function() {
    it('finds Tackle by name', function(done) {
      const found = oakdexPokedex.findMove('Tackle')
      fs.readFile('./data/move/tackle.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findMove('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findAbility', function() {
    it('finds Contrary by name', function(done) {
      const found = oakdexPokedex.findAbility('Contrary')
      fs.readFile('./data/ability/contrary.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findAbility('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findType', function() {
    it('finds Fairy by name', function(done) {
      const found = oakdexPokedex.findType('Fairy')
      fs.readFile('./data/type/fairy.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findType('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findRegion', function() {
    it('finds Region by name', function(done) {
      const found = oakdexPokedex.findRegion('Kanto')
      fs.readFile('./data/region/kanto.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findRegion('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findEggGroup', function() {
    it('finds Water 1 by name', function(done) {
      const found = oakdexPokedex.findEggGroup('Water 1')
      fs.readFile('./data/egg_group/water_1.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findEggGroup('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findGeneration', function() {
    it('finds Generation VI by name', function(done) {
      const found = oakdexPokedex.findGeneration('Generation VI')
      fs.readFile('./data/generation/6.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      const found = oakdexPokedex.findGeneration('NotKnownByMe')
      expect(found).to.equal(null);
      done();
    });
  });

  describe('#findNature', function() {
    it('finds Bold by name', function(done) {
      const found = oakdexPokedex.findNature('Bold')
      fs.readFile('./data/nature/bold.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findNature('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#findItem', function() {
    it('finds Full Restore by name', function(done) {
      const found = oakdexPokedex.findItem('Full Restore')
      fs.readFile('./data/item/full_restore.json', 'utf8', function (err, data) {
        if(err) {
          throw err;
        }
        const obj = JSON.parse(data);
        expect(found).to.eql(obj);
        done();
      });
    });

    it('returns null if entry does not exist', function(done) {
      expect(oakdexPokedex.findItem('NotKnownByMe')).to.equal(null);
      done();
    });
  });

  describe('#allPokemon', function() {
    it('finds all pokemon', function(done) {
      const list = oakdexPokedex.allPokemon()
      expect(list.length).to.equal(807);
      done();
    });

    it('finds Dark pokemon', function(done) {
      const list = oakdexPokedex.allPokemon({ type: 'Dark' })
      expect(list.length).to.equal(46);
      done();
    });

    it('finds Human-Like pokemon', function(done) {
      const list = oakdexPokedex.allPokemon({ egg_group: 'Human-Like' })
      expect(list.length).to.equal(52);
      done();
    });

    it('finds by alola id', function(done) {
      const list = oakdexPokedex.allPokemon({ dex: 'alola' })
      expect(list.length).to.equal(302);
      done();
    });
  });

  describe('#allMoves', function() {
    it('finds all moves', function(done) {
      const list = oakdexPokedex.allMoves()
      expect(list.length).to.equal(710);
      done();
    });

    it('finds Ground moves', function(done) {
      const list = oakdexPokedex.allMoves({ type: 'Ground' })
      expect(list.length).to.equal(26);
      done();
    });
  });

  describe('#allAbilities', function() {
    it('finds all abilities', function(done) {
      const list = oakdexPokedex.allAbilities()
      expect(list.length).to.equal(232);
      done();
    });
  });

  describe('#allTypes', function() {
    it('finds all types', function(done) {
      const list = oakdexPokedex.allTypes()
      expect(list.length).to.equal(18);
      done();
    });
  });

  describe('#allRegions', function() {
    it('finds all regions', function(done) {
      const list = oakdexPokedex.allRegions()
      expect(list.length).to.equal(7);
      done();
    });
  });

  describe('#allEggGroups', function() {
    it('finds all egg groups', function(done) {
      const list = oakdexPokedex.allEggGroups()
      expect(list.length).to.equal(15);
      done();
    });
  });

  describe('#allGenerations', function() {
    it('finds all generations', function(done) {
      const list = oakdexPokedex.allGenerations()
      expect(list.length).to.equal(7);
      done();
    });
  });

  describe('#allNatures', function() {
    it('finds all natures', function(done) {
      const list = oakdexPokedex.allNatures()
      expect(list.length).to.equal(25);
      done();
    });
  });

  describe('#allItems', function() {
    it('finds all items', function(done) {
      const list = oakdexPokedex.allItems()
      expect(list.length).to.equal(1);
      done();
    });

    it('finds Potions', function(done) {
      const list = oakdexPokedex.allItems({ category: 'Potions' })
      expect(list.length).to.equal(1);
      done();
    });
  });
});
