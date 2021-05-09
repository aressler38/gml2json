# gml2json

Convert graph modeling language (gml) format to json format via jison.
This is **not** intended for geographical markup language. That is a different gml.


# Usage


    const gml2json = require('gml2json');

    // Parse a raw gml string.
    let result = gml2json.parse(gmlString);
