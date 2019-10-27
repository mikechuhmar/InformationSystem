domains
treetype = tree(integer, treetype, treetype); empty()

predicates 
%Вывод дерева
print_tree(treetype)
%Сумма и количество листьевых вершин
sumAndCountLeafVertices(treetype, integer, integer)
%Среднее арифметическое листьевых вершин бинарного дерева
averageLeafVertices(treetype, integer)
%Максимум из двух чисел
max(integer, integer, integer)
%Глубина дерева
depth(treetype, integer)
%Подсчет количества вершин бинарного дерева, значения которых равны 0
countVerticesZeroVals(treetype, integer)


clauses
print_tree(empty):-!.
print_tree(tree(Root, Left, Right)):- write(Root),nl,print_tree(Left), print_tree(Right).
%Сумма и количество листьевых вершин дерева, состоящего из одного узла
sumAndCountLeafVertices(tree(Root, empty, empty), Root, 1):-!.
%Суммируются листьевые вершины левого и правого поддеревьев
sumAndCountLeafVertices(tree(Root, Left, Right), Sum, Count):- sumAndCountLeafVertices(Left, LSum, LCount), 
                                                               sumAndCountLeafVertices(Right, RSum, RCount), 
                                                               Sum = LSum + RSum, Count = LCount + RCount.
%Среднее арифметическое листьевых вершин бинарного дерева
averageLeafVertices(tree(Root, Left, Right), Avg) :- sumAndCountLeafVertices(tree(Root, Left, Right), S, C), Avg = S/C.
max(Value1, Value2, Max):- Value1 > Value2, Max = Value1, !.
max(Value1, Value2, Max):- Max = Value2.
%Глубина пустого дерева
depth(empty, 0).
%Глубина дерева, состоящего из одного узла
depth(tree(_, empty, empty), 1):-!.
%Глубина дерева
depth(tree(_, Left, Right), Depth):- depth(Left, LDepth), depth(Right, RDepth), max(LDepth, RDepth, M), Depth = M + 1.
%Количество вершин со значениием 0 в пустом дереве
countVerticesZeroVals(empty, 0).
%Количество вершин со значениием 0 в дереве с одной вершиной
countVerticesZeroVals(tree(Root, Left, Right), N):- Root = 0, countVerticesZeroVals(Left, LN), countVerticesZeroVals(Right, RN), N = LN + RN +1,!.
%Количество вершин со значениием 0 в дереве
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



