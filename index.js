const
    jison = require('jison'),
    path = require('path'),
    grammar = require(path.join(
        __dirname, 'src', 'gml_grammar.js'));

module.exports = {
    parse,
};

function parse (string) {
    const parser = new jison.Parser(grammar);
    return parser.parse(string);
}
