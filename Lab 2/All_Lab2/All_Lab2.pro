domains
int = integer
intlist = int*

predicates
%�������� ��� �������� ������ ������ � ����� �������
append(intlist, intlist, intlist)
%����� ������
len(intlist, int)
%����������� ����� �����
cyclicShiftLeft(intlist, int, intlist)
%����������� ����� ������
cyclicShiftRight(intlist, int, intlist)
%���������� ��������� � ������, �������� ������� ����� � ���������
lengthInRange(intlist, int, int, int)
%������ �� ������� � ������
enter(int, intlist)
%������ ��� ����������
distinct(intlist, intlist)
%�������� �� �������� ������ ������������� ��������� ������� ������
subset(intlist, intlist)
%�������� �� �������� ������ ������������� ��������� ������� ������ ��� ����������
subsetDistinct(intlist, intlist).
%takeout(int, intlist, intlist)
%permutation(intlist, intlist)
%unorderedSubsetDistinct(intlist, intlist).
%subset1(intlist, intlist).

clauses
%���������� ��������� � ������ ������
append([], L, L).
%���������� ��������� � �������� ������
append([X|M], L, [X|N]):- append(M, L, N).
%����� ������� ������
len([], 0).
%����� ��������� ������
len([_|T], N):- len(T, N1), N = N1 + 1.
%����������� ����� ����� � ������ ������
cyclicShiftLeft([], _, []).
%����������� ����� ����� � �������� ������ �� 0 ���������
cyclicShiftLeft(L, 0, L):-!.
%����������� ����� ����� � �������� ������ �� N ���������
cyclicShiftLeft([H|T], N, Res):- append(T, [H], Temp), N1 = N - 1, cyclicShiftLeft(Temp, N1, Res).
%����������� ����� ������ � ������ �� N ���������
%������������ ��� ������ ���������� ������������ ������ ����� �� ����� ��������� ������ ������ �������� 
%����� ������ � ���������� ���������, �� ������� ����� �������� ������
cyclicShiftRight(L, N, Res):- len(L, Length), Nl = abs(Length - N), cyclicShiftLeft(L, Nl, Res).
%���������� ��������� � ������ ������, �������� ������� ����� � ���������
lengthInRange([], _, _, 0).
%���������� ��������� � �������� ������, �������� ������� ����� � ���������
lengthInRange([H|T], Min, Max, N):- H < Max, H > Min, lengthInRange(T, Min, Max, N1), N = N1 + 1,
				    H <= Min, lengthInRange(T, Min, Max, N1), N = N1; 
				    H >= Max, lengthInRange(T, Min, Max, N1), N = N1.
%lengthInRange([H|T], Min, Max, N):- lengthInRange(T, Min, Max, N1), N = N1.

%������� ������ � ������, ���� �������� ��� �������
enter(X, [X|T]).
%������ �� ������� � ������
enter(X, [Y|T]):- enter(X, T).
%������ ��� ����������
distinct([], []).
distinct([H1|T1], [H1|T2]):- not(enter(H1, T1)), distinct(T1, T2).
distinct([H1|T1], L2):- enter(H1, T1), distinct(T1, L2).
%������ ������ �������� ������������� ������� ������
subset([], _).
%�������� �� �������� ��������� ������ ������������� ��������� ������� ������
subset([H1|T1], [H1|T2]) :- subset(T1, T2), not(enter(H1, T1)).
subset([H1|T1], [_|T2]) :- subset([H1|T1], T2), not(enter(H1, T1)).
subsetDistinct(L1, L2) :- distinct(L2, NL2), subset(L1, NL2).
%takeout(_, [], _):- !.
%takeout(H,[H|T],T). 
%takeout(H1,[H2|T2],[H2|T3]) :- takeout(H1,T2, T3). 
%permutation([],[]).
%permutation([H1], [H1]):-!.
%permutation([H1|T1],L2) :- permutation(T1,L3), takeout(H1,L2,L3). 
%unorderedSubsetDistinct(L1, L2) :- len(L2, N2), permutation(L1, PL1), len(PL1, PN1), PN1 >= 0, PN1 <= N2,  subsetDistinct(PL1, L2).
%subset1([], _).
%subset1([H1|T1],L2):- enter(H1, L2), not(enter(H1, T1)), subset1(T1, L2).

goal
%cyclicShiftRight([], 2, List).
%cyclicShiftRight([3,1,2, 4], 2, List).
%lengthInRange([], 1, 4, N).
%lengthInRange([3, 2], 1, 4, N).
%subset([], [1, 2, 3]).
%subset([1,3], [1, 2, 3]).
%subset([1, 2, X, 3], [1, 2, 4, 3]).
%subsetDistinct(L, [1, 2, 3, 3]).
subsetDistinct([1, 2, 4, 3], [1, 2, X, 3]).
%unorderedSubsetDistinct(L, [1, 2, 4, 3, 3]).
