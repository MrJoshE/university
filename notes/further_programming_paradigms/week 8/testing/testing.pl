p(X, Y):- q(X, Y).
p(X, Y):- r(X, Y).

q(X, Y):- s(X), t(Y).
r(X, Y):- u(X, Y).

s(f(a)).
t(g(b)).
u(a, g(b)).