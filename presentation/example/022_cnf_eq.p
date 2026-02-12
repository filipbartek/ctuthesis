cnf(addition,axiom,
    ( add(X,successor(Y)) = successor(add(X,Y)) ) ).

cnf(adding_zero,axiom,
    ( add(X,n0) = X ) ).

cnf(nc,negated_conjecture,
    ( successor(successor(n0)) != add(n0,successor(successor(n0))) ) ).
