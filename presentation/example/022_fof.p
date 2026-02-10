% vampire --input_syntax tptp --proof tptp --output_axiom_names true --statistics full

% equalish
fof(transitivity,axiom,
    ! [A,B,C] :
      ( ( equalish(A,B)
        & equalish(B,C) )
     => equalish(A,C) ) ).
fof(successor_substitution,axiom,
    ! [A,B] :
      ( equalish(A,B)
     => equalish(successor(A),successor(B)) ) ).

% add
fof(adding_zero,axiom,
    ! [A] :
      ( equalish(add(A,n0),A) ) ).
fof(addition,axiom,
    ! [A,B] :
      ( equalish(add(A,successor(B)),successor(add(A,B))) ) ).

fof(conjecture,conjecture,
    equalish(add(n0,successor(successor(n0))),successor(successor(n0))) ).
