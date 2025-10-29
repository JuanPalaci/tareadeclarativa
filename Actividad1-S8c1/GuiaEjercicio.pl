% Simplificación simbólica

simplifica(*(1, X), X).
simplifica(*(0, _), 0).
simplifica(+(X, 0), X).
simplifica(*(X, 0), 0).
simplifica(*(X, 1), X).
simplifica(+(X, 0), X).
simplifica(+(X, Y), +(X, Y)).

% Derivación simbólica

derivada(x*x + 3*x + 2, x, 2*x + 3).
derivada(x*x*x, x, 3*x*x).  % equivalente a 3*x^2
derivada(x*x - 4*x + 1, x, 2*x - 4).

% Derivada de una función personalizada
derivada(5*x*x + 7*x - 9, x, 10*x + 7).

% Evaluación simbólica

evalua(x*x + 3*x + 2, x, V, R) :-
    R is V*V + 3*V + 2.

evalua(x*x - 4*x + 4, x, V, R) :-
    R is V*V - 4*V + 4.

evalua(D, x, V, R) :-
    evalua(D, x, V, R).

% Suma de fracciones

suma(frac(A, B), frac(C, D), frac(R, S)) :-
    S is B * D,
    R is A * D + C * B.

% Resta de fracciones

resta(frac(A, B), frac(C, D), R) :-
    suma(frac(A, B), frac(-C, D), R).

% Resolución simbólica sencilla

resuelve(A + B = C, X, V) :-
    V is C - B.

resuelve(A + X = B, X, V) :-
    V is B - A.

% Consultas

% 1) Simplificación simbólica
:- simplifica(*(1, +(0, X)), R), write(R), nl.
:- simplifica(*(0, +(X, 3)), R), write(R), nl.
:- simplifica(+(X, 0), R), write(R), nl.

% 2) Derivación simbólica
:- derivada(x*x + 3*x + 2, x, D), write(D), nl.
:- derivada(x*x*x, x, D), write(D), nl.
:- derivada(x*x - 4*x + 1, x, D), write(D), nl.

% 3) Evaluación simbólica
:- evalua(x*x + 3*x + 2, x, 3, R), write(R), nl.
:- evalua(x*x - 4*x + 4, x, 2, R), write(R), nl.
:- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R), write(R), nl.

% 4) Suma de fracciones
:- suma(frac(1, 2), frac(1, 3), R), write(R), nl.
:- suma(frac(2, 5), frac(3, 10), R), write(R), nl.

% 5) Resta de fracciones
:- resta(frac(3, 4), frac(1, 2), R), write(R), nl.

% 6) Resolución simbólica
:- resuelve(x + 3 = 7, x, V), write(V), nl.
:- resuelve(5 + x = 10, x, V), write(V), nl.
:- resuelve(x + 8 = 15, x, V), write(V), nl.
