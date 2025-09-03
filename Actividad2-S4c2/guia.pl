% 1

% 2
% Ejercicio 4: Mayor de dos números

mayor(X, Y, Z) :-
    Z is max(X, Y).

% Ejercicio 5: Rango de edad - Crear predicado categoria_edad/1.
categoria_edad(X) :-
    (X >= 18 -> write('Es mayor de edad'); write('Es menor de edad')).

% Ejercicio 6: Nota de aprobación - Crear predicado aprobo/1.
aprobo(X) :- (X >= 7 -> write('Aprobado'); write('Desaprobado')).

nota_aprobada :-
    write('Escribe la nota del estudiante: '),
    read(X),
    aprobo(X).
nota_aprobada.

% 3

% 4

% 5

% Ejercicio 14: Calculadora sencilla - Crear predicado calculadora/4

calculadora(X, Y, S, R) :-
    (S == '+' 
        -> R is X + Y
        ;   S == '-'
            -> R is X - Y
            ;   S == '*'
                -> R is X * Y
                ;   S == '/'
                    -> R is X / Y
                    ; write('Operacion no soportada, apoya el patreon para ayudarnos a mejorar nuestra aplicacion')
    ).

calculadora.

% Ejercicio 15: Triángulo rectángulo - Crear hipotenusa/3.
hipotenusa(A, B, C) :-
    C is sqrt(**(A, 2) + **(B, 2)).

% Ejercicio 16: Sistema de calificaciones - Calcular nota máxima, mínima y promedio de una lista
nota_minima([N1|NN], Min) :-
    min_list(NN, Nmin),
    Min is min(N1, Nmin).

nota_maxima([N1|NN], Max) :-
    max_list(NN, Nmax),
    Max is max(N1, Nmax).

% Suma lista
suma_lista([], 0).
suma_lista([N1|NN], Suma) :-
    suma_lista(NN, SumaRest),
    Suma is N1 + SumaRest.

% Tamaño lista
longitud([], 0).
longitud([_|NN], L) :-
    longitud(NN, LR),
    L is LR + 1.

% Promedio
promedio_notas(Lista, Prom) :-
    suma_lista(Lista, Suma),
    longitud(Lista, N),
    N > 0,
    Prom is Suma / N.

sistema_calificaciones(Lista, Max, Min, Prom) :-
    nota_maxima(Lista, Max),
    nota_minima(Lista, Min),
    promedio_notas(Lista, Prom).
