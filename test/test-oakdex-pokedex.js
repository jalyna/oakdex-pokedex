var oakdexPokedex = require('../src/oakdex_pokedex');
var expect = require('expect.js');
var fs = require('fs');

describe('OakdexPokedex', function() {
  describe('#findPokemon', function() {
    it('finds eevee by name', function(done) {
      oakdexPokedex.findPokemon('Eevee', function(pkmn) {
        fs.readFile('./data/pokemon/eevee.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(pkmn.names.de).to.equal('Evoli');
          expect(pkmn).to.eql(obj);
          done();
        });
      });
    });

    it('finds charmander by id', function(done) {
      oakdexPokedex.findPokemon(4, function(pkmn) {
        fs.readFile('./data/pokemon/charmander.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(pkmn.names.de).to.equal('Glumanda');
          expect(pkmn).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if pokemon does not exist', function(done) {
      oakdexPokedex.findPokemon('NotKnownByMe', function(pkmn) {
        expect(pkmn).to.equal(null);
        done();
      });
    });
  });

  describe('#findMove', function() {
    it('finds Tackle by name', function(done) {
      oakdexPokedex.findMove('Tackle', function(found) {
        fs.readFile('./data/move/tackle.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findMove('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });

  describe('#findAbility', function() {
    it('finds Contrary by name', function(done) {
      oakdexPokedex.findAbility('Contrary', function(found) {
        fs.readFile('./data/ability/contrary.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findAbility('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });

  describe('#findType', function() {
    it('finds Fairy by name', function(done) {
      oakdexPokedex.findType('Fairy', function(found) {
        fs.readFile('./data/type/fairy.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findType('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });

  describe('#findEggGroup', function() {
    it('finds Water 1 by name', function(done) {
      oakdexPokedex.findEggGroup('Water 1', function(found) {
        fs.readFile('./data/egg_group/water_1.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findEggGroup('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });

  describe('#findGeneration', function() {
    it('finds Generation VI by name', function(done) {
      oakdexPokedex.findGeneration('Generation VI', function(found) {
        fs.readFile('./data/generation/6.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findGeneration('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });

  describe('#findNature', function() {
    it('finds Bold by name', function(done) {
      oakdexPokedex.findNature('Bold', function(found) {
        fs.readFile('./data/nature/bold.json', 'utf8', function (err, data) {
          if(err) {
            throw err;
          }
          var obj = JSON.parse(data);
          expect(found).to.eql(obj);
          done();
        });
      });
    });

    it('returns null if entry does not exist', function(done) {
      oakdexPokedex.findNature('NotKnownByMe', function(found) {
        expect(found).to.equal(null);
        done();
      });
    });
  });
});
