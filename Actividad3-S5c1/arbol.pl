arbol_mitologia(
    arbol(caos,
    arbol(geoa,
        arbol(cronos,
        arbol(rea,
            arbol(zeus,
                arbol(hades,
                    arbol(ares, nil, nil),
                    nil
                ),
                arbol(poseidon,
                    nil,
                    arbol(hefesto, nil, nil)
                )
            ),
            nil
        ),
        nil
        )
        ) 
    )  
).

postorden(nil, []).
postorden(arbol(X, Izq, Der), L) :-
    postorden(Izq, L1),
    postorden(Der, L2),
    append(L1, L2, L3),
    append(L3, [X], L).