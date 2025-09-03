%Ejercicio 1 Area y perimetro de un rectangulo
rectanguloA(X,Y, Resultado) :-
 Resultado is  X*Y.    

rectanguloP(X,Y, Resultado) :-
 Resultado is  X*Y.
%Ejercicio 2 Numero par e impar
parImpar(X,Modulo) :-
    Modulo is X mod 2,
    (Modulo == 0 -> write('Es par');write('es impar') ).

%Ejercicio 3 tabla de multiplicar
tabla_mul(X) :-
    tabla_mul(X, 1).

tabla_mul(_, A) :-
    A > 10, !.

tabla_mul(X, A) :-
    Resultado is X * A,
    write(Resultado), nl,
    NuevoA is A + 1,
    tabla_mul(X, NuevoA).
