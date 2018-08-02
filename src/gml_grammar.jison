/* description: Parses and executes mathematical expressions. */

/* lexical grammar */
%lex
%%


\s+                   /* skip whitespace */
Creator               return 'CREATOR'
\".*\"                return 'STRING'
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
graph                 return 'GRAPHSTART'
directed              return 'DIRECTED'
node                  return 'NODE'
edge                  return 'EDGE'
\[                    return 'LBRACKET'
\]                    return 'RBRACKET'
\w+                   return 'PROP'
<<EOF>>               return 'EOF'

/lex


%start expressions

%% /* language grammar */

expressions
    : e EOF {
        typeof console !== 'undefined' ? console.log($1) : print($1);
        return $1;
    }
    ;

e
    : CREATOR STRING
        {
            $Creator = $2.substr(1).substring(0, $2.length - 2);
        }
    | e GRAPHSTART LBRACKET
        {
            $Graph = {
                nodes: [],
                edges: [],
            };
            $List = $Graph.nodes;
            $Element = null;
            $$ = {
                creator: $Creator,
                graph: $Graph,
            };
        }
    | e DIRECTED NUMBER 
        {
            $Graph.directed = !!$3;
        }
    | e NODE LBRACKET
        {
            $List = $Graph.nodes;
            $Element = {};
        }
    | e EDGE LBRACKET
        {
            $List = $Graph.edges;
            $Element = {};
        }
    | e PROP NUMBER
        {
            $Element[$2] = Number($3);
        }
    | e PROP STRING
        {
            $Element[$2] = $3.substr(1).substring(0, $3.length - 2);
        }
    | e RBRACKET
        {
            if ($Element) {
                $List.push($Element);
            }
            $Element = undefined;
        }
    ;


