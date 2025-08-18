% Animales
mamifero(leon).
ave(aguila).
domestico(gato).
% Qué come cada uno
come(leon, carne).
come(aguila, carne).
come(gato, carne).
% Regla
comida(X) :- (mamifero(X); ave(X)), X \= leon.