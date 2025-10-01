% parte 1
%hechos de actividades
cocina(ana).
estudia(juan).
trabaja(pedro).
juega_futbol(pedro).
trabaja(sofia).
estudia(sofia).
estudia(maria).
descansa(maria).

%hechos de amistad y familiares
hermano(ana,pedro).
prima(maria,sofia).
amigo(juan,ana).
amigo(maria, juan).


%hechos de rutinas
% Ana cocina todos los días salvo cuando está cansada
rutina(ana, lunes, cocina).
rutina(ana, martes, cocina).
rutina(ana, miercoles, cocina).
rutina(ana, jueves, cocina).
rutina(ana, viernes, cocina).
rutina(ana, sabado, cocina).
rutina(ana, domingo, cocina).

% Juan estudia entre semana y descansa fines de semana
rutina(juan, lunes, estudia).
rutina(juan, martes, estudia).
rutina(juan, miercoles, estudia).
rutina(juan, jueves, estudia).
rutina(juan, viernes, estudia).
rutina(juan, sabado, descansa).
rutina(juan, domingo, descansa).

% Pedro trabaja de lunes a viernes y juega fútbol los sábados
rutina(pedro, lunes, trabaja).
rutina(pedro, martes, trabaja).
rutina(pedro, miercoles, trabaja).
rutina(pedro, jueves, trabaja).
rutina(pedro, viernes, trabaja).
rutina(pedro, sabado, juega_futbol).
rutina(pedro, domingo, descansa).

% Sofía trabaja en la tienda y estudia idiomas por las noches
rutina(sofia, lunes, trabaja).
rutina(sofia, martes, trabaja).
rutina(sofia, miercoles, trabaja).
rutina(sofia, jueves, trabaja).
rutina(sofia, viernes, trabaja).
rutina(sofia, sabado, trabaja).
rutina(sofia, domingo, trabaja).
rutina(sofia, noche, estudia).

% María estudia en la universidad y descansa los domingos
rutina(maria, lunes, estudia).
rutina(maria, martes, estudia).
rutina(maria, miercoles, estudia).
rutina(maria, jueves, estudia).
rutina(maria, viernes, estudia).
rutina(maria, sabado, estudia).
rutina(maria, domingo, descansa).

% 1. Regla actividad(X) 
actividad(X) :- cocina(X).
actividad(X) :- estudia(X).
actividad(X) :- trabaja(X).
actividad(X) :- juega_futbol(X).
actividad(X) :- descansa(X).

% 2. Regla descansa(X, Dia) 
descansa(X, Dia) :- rutina(X, Dia, descansa).

% 3. Regla parentesco(X, Y)
parentesco(X, Y) :- hermano(X, Y).
parentesco(X, Y) :- hermano(Y, X).  
parentesco(X, Y) :- prima(X, Y).
parentesco(X, Y) :- prima(Y, X).     

% Parte 3
% Regla amistad general
% Caso base, si X y Y son amigos directos
es_amigo(X, Y) :- amigo(X, Y).
es_amigo(X, Y) :- amigo(Y, X).
    
% Caso general, buscar a un amigo de Z y revisar si es amigo de X por recursion
es_amigo(X, Y) :- amigo(Z, Y), es_amigo(X, Z).
es_amigo(X, Y) :- amigo(Y, Z), es_amigo(X, Z).
es_amigo(X, Y) :- amigo(Z, Y), es_amigo(Z, X).
es_amigo(X, Y) :- amigo(Y, Z), es_amigo(Z, X).

% Miembro de una lista
miembro(X, [X|_]).
miembro(X, [_| T]) :- miembro(X, T). 

actividad(X, Y, Z) :- rutina(X, Y, Z).

% Parte 5
cocina(luis).

prima(maria, luis).

rutina(luis, lunes, cocina).
rutina(luis, martes, descansa).
rutina(luis, miercoles, cocina).
rutina(luis, jueves, descansa).
rutina(luis, viernes, cocina).
rutina(luis, sabado, descansa).
rutina(luis, domingo, descansa).

% Los amigos de primos son amigos
primo_amigo(X, Y) :- amigo(X, Y).
primo_amigo(X, Y) :- amigo(Y, X).
primo_amigo(X, Y) :- prima(Z, X), es_amigo(Z, Y).
primo_amigo(X, Y) :- prima(X, Z), es_amigo(Y, Z).