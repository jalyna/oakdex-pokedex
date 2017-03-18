var oakdexPokedex = require('../src/oakdex_pokedex');
var expect = require('expect.js');

describe('OakdexPokedex', function() {
  it('#getPokemon', function(done) {
    oakdexPokedex.getPokemon(function(pkmn) {
      expect(pkmn.names.de).to.equal('Bisasam');
      done();
    });
  });
});
