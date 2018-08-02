const 
    fs = require('fs'),
    path = require('path');

module.exports = fs.readFileSync(
    path.join(__dirname, 'gml_grammar.jison'),
    {encoding:'utf8'});
