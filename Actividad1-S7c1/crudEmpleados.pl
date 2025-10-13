% Declaramos el predicado estudiante/2 como dinámico.
:- dynamic departamento/2.
:- dynamic salario/2.
% Hechos iniciales de la base.

%departamento
departamento('Ana', contabilidad).
departamento('Luis', sistemas).
departamento('Carlos', marketing).

%salario
salario('Ana', 500).
salario('Luis', 800).
salario('Carlos', 900).



% Consultar todos los estudiantes registrados
listar_empleados :-
    writeln('--- Lista de empleados ---'),
    departamento(Nombre, Departamento),
    salario(Nombre,Salario),
    format('| Nombre: ~w | Depto: ~w | Salario: ~w  .~n', [Nombre, Departamento,Salario]), % Se muestra el nombre y curso del estudiante
    fail. %fail. se usa para forzar que Prolog explore todas las combinaciones y liste todo antes de terminar.
listar_empleados.  % Finaliza el backtracking

%listar_empleados.

%/////////////////////////////////////////////////////////////////////////////////////
agregar_empleado(Nombre, Departamento,Salario) :-
    asserta(departamento(Nombre, Departamento)),
    asserta(salario(Nombre,Salario)),
    format('Nombre: ~w.~n Departamento: ~w.~n  Salario: ~w.~n  ', [Nombre, Departamento, Salario]).

% Eliminar un empleado por nombre
eliminar_empleado(Nombre) :-
    retract(departamento(Nombre, Departamento)),
    format('Se ha eliminado a ~w del departamento ~w.~n', [Nombre, Departamento]), % ~w Imprime un término
    !. % evita múltiples eliminaciones

% Actualizar el departamento y salario de un empleado
actualizar_empleado(Nombre, NuevoDepartamento, NuevoSalario) :-
    retract(departamento(Nombre, _)),  % elimina el hecho antiguo
    assert(departamento(Nombre, NuevoDepartamento)),  % inserta el nuevo
    retract(salario(Nombre, _)),  % elimina el hecho antiguo
    assert(salario(Nombre, NuevoDepartamento)),  % inserta el nuevo
    format('Se ha actualizado el curso de ~w a ~w  con salario ~w .~n', [Nombre, NuevoDepartamento, NuevoSalario]),
    !. % evita múltiples actualizaciones

    % Eliminar todos los empleados
eliminar_todos :-
    retractall(departamento(_, _)),
    retractall(salario(_, _)),
    writeln('Todos los empleados han sido eliminados de la base.').

% Agregar solo si no existe
agregar_unico(Nombre, Departamento, Salario) :-
    (   departamento(Nombre, Departamento)
    ->  format('El empleado ~w ya está esclavizado en ~w.~n', [Nombre, Departamento])
    ;   assert(departamento(Nombre, Departamento)),
    assert(salario(Nombre, Salario)),
        format('Se ha agregado a ~w en el departamento ~w.~n', [Nombre, Departamento])
    ).
