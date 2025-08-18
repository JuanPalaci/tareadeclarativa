% Animales de granja
granja(pollo).
granja(cerdo).
granja(oveja).
% Qué come cada uno
come(pollo, granos).
come(cerdo, pasto).
come(oveja, pasto).
% Regla
comida(X) :- granja(X), X \= cerdo.
