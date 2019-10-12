domains
int = integer
intlist = integer*

predicates
enter(int, intlist)
subset(intlist, intlist)

clauses
enter(X, [X|T]).
enter(X, [Y|T]):- enter(X, T).
subset([], _).
subset([H|T], L):- enter(H, L), subset(T, L).

goal
subset([1, 2], [1, 2, 3]).
