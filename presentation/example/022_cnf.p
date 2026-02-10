% equalish
cnf(transitivity,axiom,
    ( ~ equalish(A,B)
    | ~ equalish(B,C)
    | equalish(A,C) ) ).
cnf(successor_substitution,axiom,
    ( ~ equalish(A,B)
    | equalish(successor(A),successor(B)) ) ).

% add
cnf(adding_zero,axiom,
    equalish(add(A,n0),A) ).
cnf(addition,axiom,
    equalish(add(A,successor(B)),successor(add(A,B))) ).


cnf(nc,negated_conjecture,
    ( ~ equalish(add(n0,successor(successor(n0))),successor(successor(n0))) ) ).
