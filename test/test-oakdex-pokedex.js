var oakdexPokedex = require('../src/oakdex_pokedex');
var expect = require('expect.js');
var fs = require('fs');

describe('OakdexPokedex', function() {
  describe('#findPokemon', function() {
    it('finds eevee by name', function(done) {
      oakdexPokedex.findPokemon('Eevee', function(pkmn) {
        fs.readFile('./data/pokemon/eevee.json', 'utf8', function (err, data) {
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
});
