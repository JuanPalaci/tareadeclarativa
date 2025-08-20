:- [actividad2]

% Consulta en Prolog quiénes son las personas en la mansión.
:- persona(Quienes).

% Crea una regla para identificar quién tiene un motivo para matar.
tiene_motivo(X) :- persona(X), motivo(X, Y), Y = herencia; Y= maltrato; Y = deuda; Y= negocios.


% Crea una regla para identificar quién estuvo en la biblioteca (escena del crimen).
estuvo(X, biblioteca) :- persona(X).

% Crea una regla que combine motivo y oportunidad.
motivo(X, Y) :- estuvo(X, biblioteca), Y = herencia; Y= maltrato; Y = deuda; Y= negocios.

% El informe forense revela que la víctima fue estrangulada.
arma(X) :- persona(X), acceso(X, cuerda).

% Finalmente, crea una regla para determinar quién es el asesino culpable y realiza la consulta correspondiente.
culpable(X) :- persona(X), arma(X), tiene_motivo(X), estuvo(X).

:- culpable(X).