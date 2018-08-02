module.exports = {
    run,
};

const fixture = `
Creator "sombody somewhere sometime"
graph
[
  directed 1
  node
  [
    id 0
    label "1"
  ]
  node
  [
    id 1
    label "2"
  ]
  edge
  [
    source 0
    target 1
    value 1
  ]
  edge
  [
    source 1
    target 0
    value 2
  ]
]
`;

const expected = {
    creator: 'sombody somewhere sometime',
    graph: {
        directed: true,
        edges: [
            {source: 0, target: 1, value: 1},
            {source: 1, target: 0, value: 2},
        ],
        nodes: [
            {id: 0, label: '1'},
            {id: 1, label: '2'},
        ],
    }
};


function run () {
    const 
        assert = require('assert'),
        jison = require('jison'),
        grammar = require('../src/gml_grammar.js'),
        parser = new jison.Parser(grammar),
        result = parser.parse(fixture);

    console.log(JSON.stringify(result, null, '  '));

    assert.deepEqual(result, expected);
}
