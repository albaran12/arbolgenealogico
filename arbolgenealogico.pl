padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, selma).
padre(clancy, patty).
padre(clancy, marge).
madre(mona, herbert).
madre(mona, homero).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(jacqueline, marge).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

hombre(abraham).
hombre(clancy).
hombre(homero).
hombre(herbert).
hombre(bart).
mujer(lisa).
mujer(maggie).
mujer(ling).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(mona).
mujer(jacqueline).

es_abuelo(Abuelo, Nieto) :- padre(Abuelo, Padre), padre(Padre, Nieto).
es_abuelo(Abuelo, Nieto) :- padre(Abuelo, Madre), madre(Madre, Nieto).

es_abuela(Abuela, Nieto) :- madre(Abuela, Padre), padre(Padre, Nieto).
es_abuela(Abuela, Nieto) :- madre(Abuela, Madre), madre(Madre, Nieto).

es_hermano(H1, H2) :- hombre(H1), padre(Padre, H1), padre(Padre, H2), H1 \= H2.
es_hermana(H1, H2) :- mujer(H1), padre(Padre, H1), padre(Padre, H2), H1 \= H2.

es_tio(Tio, Sobrino) :- es_hermano(Tio, Padre), padre(Padre, Sobrino), hombre(Tio).
es_tio(Tio, Sobrino) :- es_hermano(Tio, Madre), madre(Madre, Sobrino), hombre(Tio).

es_tia(Tia, Sobrino) :- es_hermana(Tia, Padre), padre(Padre, Sobrino), mujer(Tia).
es_tia(Tia, Sobrino) :- es_hermana(Tia, Madre), madre(Madre, Sobrino), mujer(Tia).

es_primo(P1, P2) :- es_tio(Tio, P1), padre(Tio, P2), hombre(P1), P1 \= P2.
es_prima(P1, P2) :- es_tia(Tia, P1), madre(Tia, P2), mujer(P1), P1 \= P2.

es_esposo(Esposo, Esposa) :- padre(Esposo, Hijo), madre(Esposa, Hijo), hombre(Esposo), Esposo \= Esposa.
es_esposa(Esposa, Esposo) :- padre(Esposo, Hijo), madre(Esposa, Hijo), mujer(Esposa), Esposa \= Esposo.