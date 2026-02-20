%Hombres
hombre('Alan').
hombre('Ernesto').
hombre('Efren').
hombre('Epifanio').
hombre('Humberto').
hombre('Jose de Jesus').
hombre('Jose de Jesus Jr').
hombre('Pedro').
hombre('Sabino').
hombre('Guadalupe').
hombre('Aureliano').
hombre('Eduardo').
hombre('Cristian').
hombre('Chava').
hombre('Adrian').
hombre('Luis').
hombre('Rosendo').
hombre('Luis Angel').
hombre('Diego').
hombre('Oswaldo').
hombre('Saul').
hombre('Omar').
hombre('Kevin').
hombre('Adriancito').
hombre('Leonardo').
hombre('Eliab').
hombre('Christian').

%Mujeres
mujer('Alicia').
mujer('Maria del Refugio').
mujer('Amparo').
mujer('Rebeca').
mujer('Cristina').
mujer('Adela').
mujer('Aurora').
mujer('Maria Guadalupe').
mujer('Esperanza').
mujer('Lourdes').
mujer('Maria').
mujer('Raquel').
mujer('Socorro').
mujer('Cirila').
mujer('Maria Juanita').
mujer('Evelia').
mujer('Beatriz').
mujer('Margarita').
mujer('Marisela').
mujer('Carolina').
mujer('Yolanda').
mujer('Jessy').
mujer('Edith').
mujer('Mariela').
mujer('Aylin').
mujer('Monica1').
mujer('Monica2').
mujer('Jazmin').

%Parejas
pareja('Ernesto','Alicia').
pareja('Efren','Maria del Refugio').
pareja('Pedro','Evelia').

pareja('Luis','Yolanda').
pareja('Eduardo','Carolina').
pareja('Cristian','Marisela').
pareja('Chava','Margarita').
pareja('Adrian','Beatriz').

pareja('Oswaldo','Edith').
pareja('Saul','Jessy').
pareja('Kevin','Mariela').
pareja('Luis Angel','Monica1').
pareja('Omar','Monica2').
pareja('Diego','Jazmin').

%Progenitores
% Padres directos
progenitor('Ernesto','Alan').
progenitor('Alicia','Alan').

% Abuelos paternos
progenitor('Efren','Ernesto').
progenitor('Maria del Refugio','Ernesto').

% Abuelos maternos
progenitor('Pedro','Alicia').
progenitor('Evelia','Alicia').

% Bisabuelos
progenitor('Epifanio','Pedro').
progenitor('Cirila','Pedro').

progenitor('Jose de Jesus','Evelia').
progenitor('Maria Juanita','Evelia').

% Tíos de sangre
progenitor('Pedro','Beatriz').
progenitor('Evelia','Beatriz').

progenitor('Pedro','Margarita').
progenitor('Evelia','Margarita').

progenitor('Pedro','Marisela').
progenitor('Evelia','Marisela').

progenitor('Pedro','Carolina').
progenitor('Evelia','Carolina').

progenitor('Pedro','Luis').
progenitor('Evelia','Luis').

progenitor('Pedro','Rosendo').
progenitor('Evelia','Rosendo').

% Primos
progenitor('Luis','Luis Angel').
progenitor('Yolanda','Luis Angel').

progenitor('Luis','Diego').
progenitor('Yolanda','Diego').

progenitor('Luis','Jessy').
progenitor('Yolanda','Jessy').

progenitor('Luis','Edith').
progenitor('Yolanda','Edith').

progenitor('Margarita','Omar').
progenitor('Chava','Omar').

progenitor('Margarita','Mariela').
progenitor('Chava','Mariela').

progenitor('Margarita','Aylin').
progenitor('Chava','Aylin').

progenitor('Adrian','Adriancito').
progenitor('Beatriz','Adriancito').

progenitor('Adrian','Leonardo').
progenitor('Beatriz','Leonardo').

progenitor('Eduardo','Eliab').
progenitor('Carolina','Eliab').

progenitor('Eduardo','Christian').
progenitor('Carolina','Christian').

% Hijos de Epifanio y Cirila
progenitor('Epifanio','Maria del Refugio').
progenitor('Cirila','Maria del Refugio').

progenitor('Epifanio','Humberto').
progenitor('Cirila','Humberto').

progenitor('Epifanio','Guadalupe').
progenitor('Cirila','Guadalupe').

progenitor('Epifanio','Aureliano').
progenitor('Cirila','Aureliano').

progenitor('Epifanio','Lourdes').
progenitor('Cirila','Lourdes').

progenitor('Epifanio','Maria').
progenitor('Cirila','Maria').

progenitor('Epifanio','Raquel').
progenitor('Cirila','Raquel').

% Hijos de José de Jesús y María Juanita
progenitor('Jose de Jesus','Evelia').
progenitor('Maria Juanita','Evelia').

progenitor('Jose de Jesus','Jose de Jesus Jr').
progenitor('Maria Juanita','Jose de Jesus Jr').

progenitor('Jose de Jesus','Amparo').
progenitor('Maria Juanita','Amparo').

progenitor('Jose de Jesus','Rebeca').
progenitor('Maria Juanita','Rebeca').

progenitor('Jose de Jesus','Cristina').
progenitor('Maria Juanita','Cristina').

progenitor('Jose de Jesus','Adela').
progenitor('Maria Juanita','Adela').

progenitor('Jose de Jesus','Aurora').
progenitor('Maria Juanita','Aurora').

progenitor('Jose de Jesus','Maria Guadalupe').
progenitor('Maria Juanita','Maria Guadalupe').

progenitor('Jose de Jesus','Esperanza').
progenitor('Maria Juanita','Esperanza').

progenitor('Jose de Jesus','Socorro').
progenitor('Maria Juanita','Socorro').


%reglas
padre(P,H) :- hombre(P), progenitor(P,H).
madre(M,H) :- mujer(M), progenitor(M,H).

hijo(H,P) :- hombre(H), progenitor(P,H).
hija(H,P) :- mujer(H), progenitor(P,H).

hermanos(X,Y) :-progenitor(P,X),progenitor(P,Y),X \= Y.

hermano(X,Y) :- hermanos(X,Y), hombre(X).
hermana(X,Y) :- hermanos(X,Y), mujer(X).

abuelo(A,N) :- padre(A,X), progenitor(X,N).

abuela(A,N) :- madre(A,X), progenitor(X,N).

bisabuelo(B,N) :- padre(B,X), abuelo(X,N).

bisabuela(B,N) :- madre(B,X), abuela(X,N).

tio(T,S) :- hermano(T,P), progenitor(P,S).

tia(T,S) :- hermana(T,P), progenitor(P,S).

tio_politico(Tp,S) :- pareja(Tp,T), tio(T,S).

tia_politica(Tp,S) :- pareja(Tp,T), tia(T,S).

tioabuelo(T,S) :- hermano(T,A), abuelo(A,S).

tiaabuela(T,S) :- hermana(T,A), abuela(A,S).

primos(X,Y) :- progenitor(P1,X), progenitor(P2,Y),hermanos(P1,P2), X \= Y.