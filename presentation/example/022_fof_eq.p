fof(addition,axiom,
    ! [A,B] :
      ( add(A,successor(B)) = successor(add(A,B)) ) ).

fof(adding_zero,axiom,
    ! [A] :
      ( add(A,n0) = A ) ).

fof(conjecture,conjecture,
    add(n0,successor(successor(n0))) = successor(successor(n0)) ).
