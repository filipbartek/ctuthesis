fof(f,plain,(
  $false),
  inference(trivial_inequality_removal,[],[c6])).
fof(c6,plain,(
  s(s(z)) != s(s(z))),
  inference(superposition,[],[c5,a0])).
fof(a0,axiom,(
  ( ! [X0] : (add(X0,z) = X0) )),
  file('022.p',unknown)).
fof(c5,plain,(
  s(s(z)) != s(s(add(z,z)))),
  inference(superposition,[],[c4,as])).
fof(as,axiom,(
  ( ! [X0,X1] : (add(X0,s(X1)) = s(add(X0,X1))) )),
  file('022.p',unknown)).
fof(c4,plain,(
  s(s(z)) != s(add(z,s(z)))),
  inference(superposition,[],[nc,as])).
fof(nc,axiom,(
  s(s(z)) != add(z,s(s(z)))),
  file('022.p',unknown)).

