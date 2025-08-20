% Personas presentes
persona(alice).
persona(robert).
persona(clara).
persona(james).


% Relaciones
esposo(alice, lord_henry).
sobrina(clara, lord_henry).
socio(james, lord_henry).
empleado(robert, lord_henry).

% Motivos (quién podría tener razones)
motivo(alice, herencia).
motivo(robert, maltrato).
motivo(clara, deuda).
motivo(james, negocios).

% Medios (quién tuvo acceso al arma)
acceso(alice, veneno).
acceso(robert, cuchillo).
acceso(clara, cuerda).
acceso(james, pistola).

% Oportunidad (quién estuvo en la biblioteca)
estuvo(alice, sala).
estuvo(robert, cocina).
estuvo(clara, biblioteca).
estuvo(james, estudio).

% Crea una regla para identificar quién tiene un motivo para matar.
tiene_motivo(X) :- motivo(X, _).

% Crea una regla para identificar quién estuvo en la biblioteca (escena del crimen).
escena_crimen(X) :- estuvo(X, biblioteca).

% Crea una regla que combine motivo y oportunidad.
motivo_oportunidad(X) :- tiene_motivo(X), escena_crimen(X).

% El informe forense revela que la víctima fue estrangulada.
arma(X) :- acceso(X, cuerda).

% Finalmente, crea una regla para determinar quién es el asesino culpable y realiza la consulta correspondiente.
culpable(X) :- motivo_oportunidad(X), arma(X).