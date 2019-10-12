domains
int = integer
intlist = int*

predicates
len(intlist, int)
lengthInRange(intlist, int, int, int)

clauses
len([], 0).
len([_|T], N):- len(T, N1), N = N1 + 1.
lengthInRange([], _, _, 0).
lengthInRange([H|T], Min, Max, N):- H > Min, H < Max, lengthInRange(T, Min, Max, N1), N = N1 + 1; 
				    H <= Min, lengthInRange(T, Min, Max, N1), N = N1; 
				    H >= Max, lengthInRange(T, Min, Max, N1), N = N1.

goal
LengthInRange([3, 2], 1, 4, N).