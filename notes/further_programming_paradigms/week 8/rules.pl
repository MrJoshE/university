parent(10,5).
parent(5,4).

predecessor(X,Y):-parent(X,Y).
predecessor(X,Z):-parent(X,Y),parent(Y,Z).

