domains
treetype = tree(integer, treetype, treetype); empty()

predicates 
%����� ������
print_tree(treetype)
%����� � ���������� ��������� ������
sumAndCountLeafVertices(treetype, integer, integer)
%������� �������������� ��������� ������ ��������� ������
averageLeafVertices(treetype, integer)
%�������� �� ���� �����
max(integer, integer, integer)
%������� ������
depth(treetype, integer)
%������� ���������� ������ ��������� ������, �������� ������� ����� 0
countVerticesZeroVals(treetype, integer)


clauses
print_tree(empty):-!.
print_tree(tree(Root, Left, Right)):- write(Root),nl,print_tree(Left), print_tree(Right).
%����� � ���������� ��������� ������ ������, ���������� �� ������ ����
sumAndCountLeafVertices(tree(Root, empty, empty), Root, 1):-!.
%����������� ��������� ������� ������ � ������� �����������
sumAndCountLeafVertices(tree(Root, Left, Right), Sum, Count):- sumAndCountLeafVertices(Left, LSum, LCount), 
                                                               sumAndCountLeafVertices(Right, RSum, RCount), 
                                                               Sum = LSum + RSum, Count = LCount + RCount.
%������� �������������� ��������� ������ ��������� ������
averageLeafVertices(tree(Root, Left, Right), Avg) :- sumAndCountLeafVertices(tree(Root, Left, Right), S, C), Avg = S/C.
max(Value1, Value2, Max):- Value1 > Value2, Max = Value1, !.
max(Value1, Value2, Max):- Max = Value2.
%������� ������� ������
depth(empty, 0).
%������� ������, ���������� �� ������ ����
depth(tree(_, empty, empty), 1):-!.
%������� ������
depth(tree(_, Left, Right), Depth):- depth(Left, LDepth), depth(Right, RDepth), max(LDepth, RDepth, M), Depth = M + 1.
%���������� ������ �� ���������� 0 � ������ ������
countVerticesZeroVals(empty, 0).
%���������� ������ �� ���������� 0 � ������ � ����� ��������
countVerticesZeroVals(tree(Root, Left, Right), N):- Root = 0, countVerticesZeroVals(Left, LN), countVerticesZeroVals(Right, RN), N = LN + RN +1,!.
%���������� ������ �� ���������� 0 � ������
countVerticesZeroVals(tree(Root, Left, Right), N):- countVerticesZeroVals(Left, LN), countVerticesZeroVals(Right, RN), N = LN + RN.





goal
%print_tree(tree(2, tree(3, empty, empty), tree(4, empty, empty))).
%sumAndCountLeafVertices(tree(2, tree(3, tree(5, empty, empty), tree(6, empty, empty)), tree(4, empty, empty)), Sum, Count).
%averageLeafVertices(tree(2, tree(3, tree(5, empty, empty), tree(6, empty, empty)), tree(4, empty, empty)), Avg).
%averageLeafVertices(tree(2,  empty, empty), Avg).
%max(3, 2, Res).
%depth(tree(2, tree(3, tree(5, empty, empty), tree(6, empty, empty)), tree(4, empty, empty)), Depth).
%depth(tree(2, empty, empty), Depth).
%depth(empty, Depth).
%countVerticesZeroVals(empty, N).
%countVerticesZeroVals(tree(0, empty, empty), N).
countVerticesZeroVals(tree(0, tree(4, tree(5, empty, empty), tree(0, empty, empty)), tree(0, empty, empty)), N).



