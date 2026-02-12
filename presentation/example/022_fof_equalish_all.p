% equalish
cnf(reflexivity,axiom,
    equalish(A,A) ).

cnf(symmetry,axiom,
    ( ~ equalish(A,B)
    | equalish(B,A) ) ).

cnf(transitivity,axiom,
    ( ~ equalish(A,B)
    | ~ equalish(B,C)
    | equalish(A,C) ) ).

cnf(add_substitution1,axiom,
    ( ~ equalish(A,B)
    | ~ equalish(C,add(A,D))
    | equalish(C,add(B,D)) ) ).

cnf(add_substitution2,axiom,
    ( ~ equalish(A,B)
    | ~ equalish(C,add(D,A))
    | equalish(C,add(D,B)) ) ).

cnf(successor_equality1,axiom,
    ( ~ equalish(successor(A),successor(B))
    | equalish(A,B) ) ).

cnf(successor_substitution,axiom,
    ( ~ equalish(A,B)
    | equalish(successor(A),successor(B)) ) ).

% add
fof(adding_zero,axiom,
    ! [A] :
      ( equalish(add(A,n0),A) ) ).
fof(addition,axiom,
    ! [A,B] :
      ( equalish(add(A,successor(B)),successor(add(A,B))) ) ).

% conjecture
fof(conjecture,conjecture,
    equalish(add(n0,successor(successor(n0))),successor(successor(n0))) ).
