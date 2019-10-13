domains
int = integer
intlist = int*

predicates
append(intlist, intlist, intlist)
len(intlist, int)
cyclicShiftLeft(intlist, int, intlist)
cyclicShiftRight(intlist, int, intlist)
lengthInRange(intlist, int, int, int)
enter(int, intlist)
subset(intlist, intlist)

clauses
append([], L, L).
append([X|M], L, [X|N]):- append(M, L, N).
len([], 0).
len([_|T], N):- len(T, N1), N = N1 + 1.
cyclicShiftLeft([], _, []).
cyclicShiftLeft(L, 0, L):-!.
cyclicShiftLeft([H|T], N, Res):- append(T, [H], Temp), N1 = N - 1, cyclicShiftLeft(Temp, N1, Res).
cyclicShiftRight(L, N, Res):- len(L, Length), Nl = abs(Length - N), cyclicShiftLeft(L, Nl, Res).
lengthInRange([], _, _, 0).
lengthInRange([H|T], Min, Max, N):- H > Min, H < Max, lengthInRange(T, Min, Max, N1), N = N1 + 1; 
				    H <= Min, lengthInRange(T, Min, Max, N1), N = N1; 
				    H >= Max, lengthInRange(T, Min, Max, N1), N = N1.
enter(X, [X|T]).
enter(X, [Y|T]):- enter(X, T).
subset([], _).
subset([H|T], L):- enter(H, L), subset(T, L).

goal
%cyclicShiftRight([3,4,5,1,2], 1, List).
%lengthInRange([3, 2], 1, 4, N).
subset([1, 5], [1, 2, 3]).