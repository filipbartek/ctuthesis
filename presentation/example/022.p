cnf(as,axiom,
    ( add(X,s(Y))=s(add(X,Y)) ) ).

cnf(a0,axiom,
    ( add(X,0)=X ) ).

cnf(nc,negated_conjecture,
    ( ~ add(0,s(s(0)))=s(s(0)) ) ).

