// npm install json-schema-to-markdown

var parse = require('json-schema-to-markdown')
const fs = require('fs');
fs.readdir('./data/schemas/', (err, files) => {
  files.forEach(file => {
    console.log(file);
    var schema = require('./data/schemas/' + file)
    var markdown = parse(schema)
    fs.writeFile('./doc/' + file.replace('.json', '') + '.md', markdown, function() {
      console.log('saved')
    }); 
  });
})
