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
    filenames = filenames.filter(function(filename) {
      return filename.includes('.json');
    });
    filenames.forEach(function(filename) {
      fs.readFile('./data/' + type + '/' + filename, function (err, data) {
        if(err) {
          throw err;
        }
        var obj = JSON.parse(data);
        _this.byName[type][obj.names.en] = obj;
        if(Object.keys(_this.byName[type]).length == filenames.length) {
          cb(_this.byName[type]);
        }
      });
    });
  });
};

module.exports = {

  findPokemon: function(idOrName, cb) {
    allByName('pokemon', function(list) {
      obj = list[idOrName];
      if(!obj) {
        cb(null);
        return;
      }
      cb(obj);
    });
  }

};
