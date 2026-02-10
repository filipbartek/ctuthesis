% equalish
fof(equality,axiom,
    ! [A,B] :
      ( equalish(A,B)
     => A=B ) ).

% add
fof(adding_zero,axiom,
    ! [A] :
      ( equalish(add(A,n0),A) ) ).
fof(addition,axiom,
    ! [A,B] :
      ( equalish(add(A,successor(B)),successor(add(A,B))) ) ).


fof(conjecture,conjecture,
    equalish(add(n0,successor(successor(n0))),successor(successor(n0))) ).
