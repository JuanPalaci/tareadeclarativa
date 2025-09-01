estudiante(kelvin).
estudiante(raul).
estudiante(lorenz).
estudiante(mauricio).
estudiante(melissa).

% NEGACIÓN 
% Determinar si ellacuria no es estudiante
no_es_estudiante(Nombre) :-
    \+ estudiante(Nombre).

% CORTE
% Obtener solo el primer estudiante de la lista
primer_estudiante(X):-
    estudiante(X), !.

% FALLO
% listar todos los estudiantes usando fail
mostrar_estudiantes :-
    estudiante(Nombre),
    write('Nombre: '),
    write(Nombre),
    nl,
    fail.
mostrar_estudiantes.

% I/O
% Pedir nombre y verificar si es estudiante
es_estudiante :-
    write('Ingrese un nombre: '), read(Nombre),
    ( estudiante(Nombre)
    -> write('Es estudiante')
    ; write('No es estudiante')
    ).