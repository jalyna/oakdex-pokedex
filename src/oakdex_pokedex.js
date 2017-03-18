var fs = require('fs');

module.exports = {

  getPokemon: function(cb) {
    fs.readFile('./data/pokemon/bulbasaur.json', 'utf8', function (err, data) {
      var obj = JSON.parse(data);
      cb(obj);
    });
  }

};
