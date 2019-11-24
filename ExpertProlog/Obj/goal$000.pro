DATABASE
found(string)
xpositive(string,string)
xnegative(string,string)

PREDICATES
ask(string,string)
it_is(string)
positive(string,string)
run
clear_facts
remember(string,string,string)
find_cause
test1(string)
test2(string,string)
test3(string,string,string)
test4(string,string,string,string)

CLAUSES
run :- find_cause,found(X),write("Причина неработоспособности компьютера - ",X),nl,clear_facts,!.
run:- nl,write("Система не может определить причину неработоспособности компьютера."), nl, clear_facts.
find_cause :- test1(X),test2(X,Y),test3(X,Y,Z),test4(X,Y,Z,_),!.
find_cause.
positive(X,Y) :- xpositive(X,Y),!.
positive(X,Y) :- not(xnegative(X,Y)), ask(X,Y).
ask(X,Y) :- write(X), write(" "), write(Y), write("?"), nl, readln(Reply), remember(X,Y,Reply).
remember(X,Y,"да") :- asserta(xpositive(X,Y)).
remember(X,Y,"нет") :- asserta(xnegative(X,Y)),fail.
clear_facts :- retractall(xpositive(_,_)),fail.
clear_facts :- retractall(xnegative(_,_)),fail.         
clear_facts :- retractall(found(_)),fail.
clear_facts :- write("Нажмите Enter для выхода."), readln(_).  
test1("a") :- it_is("Предположение1"), !.
test1("n").
test2("a","b") :- positive("Происходят","зависания компьютера"), !.
test2("a","n").
test2("n","b") :- positive("Происходят","зависания компьютера"), !.
test2("n","n").
test3("a","b","c") :- positive("Происходят","перегревания компьютера"),asserta(found("Вирусы на компьютере")), !.
test3("a","b","n") :- asserta(found("Неисправность жёсткого диска")), !.
test3("a","n","d") :- positive("Отсутствует", "изображение"), asserta(found("Неправильные настройки BIOS")), !.
test3("a","n","n").
test3("n","b","e") :- positive("Наблюдается","периодическая или постоянная невозможность включения"), !.
test3("n","b","n").
test3("n","n","d") :- positive("Отсутствует", "изображение"), !.
test3("n","n","n").
test4("a","n","n","e") :- positive("Наблюдается","периодическая или постоянная невозможность включения"), asserta(found("Неисправность блока питания")), !.
test4("a","n","n","n") :- asserta(found("Неисправность процессора")).
test4("n","b","e","d") :- positive("Отсутствует", "изображение"), asserta(found("Неисправность видеокарты")), !.
test4("n","b","e", "n") :- asserta(found("Вздувшиеся конденсаторы")).
test4("n","b","n","c") :- positive("Происходят","перегревания компьютера"), asserta(found("Неисправность системы охлаждения")), !.
test4("n","b","n", "n") :- asserta(found("Ошибки, возникшие при установке операционной системы")).
test4("n","n","d","e") :- positive("Наблюдается","периодическая или постоянная невозможность включения"), asserta(found("Сгоревшие транизисторы")), !.
test4("n","n","d", "n") :- asserta(found("Неисправность монитора")).

it_is("Предположение1") :- positive("Наюлюдаются","циклические перезагрузки компьютера"), positive("Отсутствует","загрузка компьютера").

goal
run.

