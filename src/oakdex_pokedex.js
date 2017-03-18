var fs = require('fs');

var allByName = function(type, cb) {
  if(!this.byName) {
    this.byName = {};
  }
  if(this.byName[type]) {
    cb(this.byName[type]);
    return;
  }
  var _this = this;
  _this.byName[type] = {};
  fs.readdir('./data/' + type, function(err, filenames) {
    if(err) {
      throw err;
    }
    filenames = filenames.filter(function(filename) {
      return filename.indexOf('.json') !== -1;
    });
    filenames.forEach(function(filename) {
      fs.readFile('./data/' + type + '/' + filename, function (err, data) {
        if(err) {
          throw err;
        }
        var obj = JSON.parse(data);
        _this.byName[type][obj.names.en] = obj;
        if(Object.keys(_this.byName[type]).length === filenames.length) {
          return cb(_this.byName[type]);
        }
      });
    });
  });
};

var pokemonById = function(cb) {
  var _this = this;
  if(_this.pokemonByIdList) {
    cb(_this.pokemonByIdList);
    return;
  }
  _this.pokemonByIdList = {};
  allByName('pokemon', function(list) {
    Object.keys(list).map(function(key, _index) {
      _this.pokemonByIdList[list[key].national_id] = list[key];
    });
    cb(_this.pokemonByIdList);
  });
};

var findByType = function(type, name, cb) {
  allByName(type, function(list) {
    var obj = list[name];
    if(!obj) {
      cb(null);
      return;
    }
    cb(obj);
  });
};

module.exports = {

  findPokemon: function(idOrName, cb) {
    allByName('pokemon', function(list) {
      var obj = list[idOrName];
      if(!obj) {
        pokemonById(function(listId) {
          obj = listId[idOrName];
          if(!obj) {
            cb(null);
            return;
          }
          cb(obj);
        });
        return;
      }
      cb(obj);
    });
  },

  findMove: function(name, cb) {
    findByType('move', name, cb);
  },

  findAbility: function(name, cb) {
    findByType('ability', name, cb);
  },

  findType: function(name, cb) {
    findByType('type', name, cb);
  },

  findEggGroup: function(name, cb) {
    findByType('egg_group', name, cb);
  },

  findGeneration: function(name, cb) {
    findByType('generation', name, cb);
  },

  findNature: function(name, cb) {
    findByType('nature', name, cb);
  }

};
