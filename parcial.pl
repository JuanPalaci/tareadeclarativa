personaje(shrek).
personaje(farquad).
personaje(fiona).
personaje(burro).
personaje(dragon).
personaje(enano).
personaje(hada).
personaje(oso).
personaje(lobo).
personaje(munieco_jengibre).

amigo(shrek, burro).

feroz(dragona).

vive_en(shrek, pantano).
vive_en(enano, pantano).
vive_en(hada, pantano).
vive_en(oso, pantano).
vive_en(munieco_jengibre, pantano).
vive_en(burro, pantano).
vive_en(dragona, castillo).
vive_en(farquad, castillo).

rescata(shrek, fiona).

valiente(shrek).

desea(farquad, casarse_con_fiona).

transforma_en(fiona, princesa).

% personaje()
% vive_en(X, Y)
% amigo(X, Y)
% rescata(X, Y)
% desea(X, Y)
% transforma_en(X, Y)
% valiente(X)
% feroz(Y)

% Reglas
% Quien vive en el pantano
vive_pantano(X) :- vive_en(X, pantano), personaje(X).

% Amigo de shrek
amigo_shrek(X) :- amigo(shrek, X).

% Quien desea casarse con fiona
% desea(X, casarse_con_fiona).

% Shrek rescata a fiona?
% rescata(shrek, fiona).

% Quien es valiente
es_valiente(X) :- valiente(X).

% Quien es feroz
es_feroz(X) :- feroz(X).

% Quienes llegaron expulsados al pantano
% vive_en(X, pantano), X /= shrek, X /= fiona.