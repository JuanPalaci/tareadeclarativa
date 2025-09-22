vive_en(ernesto, valle_verde).
vive_en(teresa, valle_verde).
vive_en(miguel, valle_verde).
vive_en(sofia, capital).
vive_en(carlos, capital).
vive_en(mateo, capital).
vive_en(valeria, capital).
vive_en(ana, valle_verde).
vive_en(lucia, capital).
vive_en(ricardo, capital).
vive_en(daniel, capital).
vive_en(laura, capital).
vive_en(mateo, capital).
casado_con(ernesto, teresa).
casado_con(carlos, sofia).
padre(ernesto, carlos).
madre(teresa, carlos).
hijo(carlos, ernesto).
hijo(carlos, teresa).
padre(ernesto, ana).
madre(teresa, ana).
hijo(ana, ernesto).
hijo(ana, teresa).
padre(ernesto, lucia).
madre(teresa, lucia).
hijo(lucia, ernesto).
hijo(lucia, teresa).
padre(carlos, mateo).
madre(sofia, mateo).
hijo(mateo, carlos).
hijo(mateo, sofia).
padre(carlos, valeria).
madre(sofia, valeria).
hijo(valeria, carlos).
hijo(valeria, sofia).
hijo(andres, ana).
trabaja_en(ernesto, maestro).
trabaja_en(teresa, enfermera).
trabaja_en(carlos, ingeniero_civil).
trabaja_en(sofia, arquitecta).
trabaja_en(ana, maestro).
trabaja_en(laura, bibliotecaria).
primo(lucia, daniel).
primo(carlos, daniel).
primo(ana, daniel).
amigo(carlos, ricardo).
trabaja_en(ricardo, abogado).
trabaja_en(miguel, agricultor).
casado_con(ricardo, laura).
hijo(daniel, ricardo).
hijo(daniel, laura).
padre(ricardo, daniel).
madre(laura, daniel).
amigo(mateo, daniel).
amigo(daniel, valeria).
casado_con(miguel, rosa).
trabaja_en(rosa, vendedora).
padre(miguel, fernanda).
madre(rosa, fernanda).
hijo(fernanda, rosa).
primo(fernanda, carlos).
primo(fernanda, ana).
primo(fernanda, lucia).
hijo(fernanda, miguel).
primo(fernanda, mateo).
primo(fernanda, andres).
primo(fernanda, valeria).
amiga(carmen, teresa).
trabaja_en(carmen, partera).
vive_en(carmen, valle_verde).
amigo(miguel, felipe).
trabaja_en(felipe, comerciante).
vive_en(felipe, capital).
hijo(joaquin, felipe).
padre(felipe, joaquin).
amigo(andres, joaquin).
nieto(isabel, carmen).

es_abuelo(X) :- padre(X, Y), padre(Y, _).
es_abuelo(X) :- padre(X, Y), madre(Y, _).
es_abuelo(X) :- madre(X, Y), madre(Y, _).
es_abuelo(X) :- madre(X, Y), padre(Y, _).
es_abuelo(X) :- nieto(_, X).

es_hermano(X, Y) :- padre(C, X), padre(C, Y).
es_hermano(X, Y) :- madre(C, X), madre(C, Y).
es_hermano(X, Y) :- hijo(X, C), hijo(X, C).

es_tio(X) :- hijo(_, C), es_hermano(X, C).
es_tio(X) :- padre(C, _), es_hermano(X, C).
es_tio(X) :- madre(C, _), es_hermano(X, C).

primo_def(X, Y) :- hijo(X, C), hijo(Y, D), es_hermano(C, D).

amigo_primo(X) :- amigo(X, D), primo(_, D).
amigo_primo(X) :- amigo(X, D), primo(D, _).
amigo_primo(X) :- amigo(D, X), primo(_, D).
amigo_primo(X) :- amigo(D, X), primo(D, _).

abuelo(X, Y) :- padre(X, C), padre(C, Y).
abuelo(X, Y) :- padre(X, C), madre(C, Y).
abuelo(X, Y) :- madre(X, C), madre(C, Y).
abuelo(X, Y) :- madre(X, C), padre(C, Y).
abuelo(X, Y) :- nieto(Y, X).
mostrar_madres :-
    madre(Madre, Rol),
    write('Madre: '), write(Madre), nl,
    fail.
mostrar_madres.
% PARTE 3
% hijo(X, ernesto).
% abuelo(X, mateo).
% padre(X, C), padre(X, D), D\=C ; madre(X, C), madre(X, D), D\=C.
% mostrar_madres.
