const modules = [
    require('./test_grammar.js'),
];

for (let module of modules) {
    module.run();
}

console.log('PASS');
