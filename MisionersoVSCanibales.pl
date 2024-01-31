
initial_state(state(3, 3, 0, 0, izquierda)).

final_state(state(0,0,3,3,derecha)).

%dos canibales en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(2, 0, derecha)) :-
    (MI >= 1 ; MI = 0),
    (MD >= CI ; MD = 0),
    CI >= 2,
    MI = MI2,
    MD = MD2,
    CI2 is CI - 2,
    CD2 is CD + 2.

%un canibal en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(1, 0, izquierda)) :-
    (MI >= 2 ; MI = 0),
    (MD >= 2 ; MD = 0),
    CD >= 1,
    MI = MI2,
    MD = MD2,
    CI2 is CI + 1,
    CD2 is CD - 1.

%un canibal y un misionero en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(1, 1, izquierda)) :-
    (MI = CI ; MI = 0),
    (MD = CD ; MD = 0),
    MI2 is MI + 1,
    MD2 is MD - 1,
    CI2 is CI + 1,
    CD2 is CD - 1.

%dos misioneros en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(0, 2, derecha)) :-
    (MI >= 2),
    (MD >= CD ; MD = 0),
    CI = CI2,
    CD = CD2,
    MI2 is MI - 2,
    MD2 is MD + 2.

%dos canibales en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(2, 0, izquierda)) :-
    (MI >= 2 ; MI = 0),
    (MD >= 1 ; MD = 0),
    CD >= 2,
    MI = MI2,
    MD = MD2,
    CI2 is CI + 2,
    CD2 is CD - 2.

%un canibal en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(1, 0, derecha)) :-
    (MD >= CD ; MD = 0),
    (MI >= 2 ; MI = 0),
    CI >= 1,
    MI = MI2,
    MD = MD2,
    CI2 is CI - 1,
    CD2 is CD + 1.

%un canibal y un misionero en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(1, 1, derecha)) :-
    (MD = CD ; MD = 0),
    (MI = CI ; MI = 0),
    MD2 is MD + 1,
    MI2 is MI - 1,
    CD2 is CD + 1,
    CI2 is CI - 1.

%The methods below this comment were done by chatGPT based on the previous rules that i did.

%dos misioneros en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(0, 2, izquierda)) :-
    (MI >= 2 ; MI = 0),
    (MD >= 1 ; MD = 0),
    CD >= 2,
    CI = CI2,
    MD = MD2,
    MI2 is MI - 2,
    CD2 is CD + 2.

%un misionero en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(0, 1, derecha)) :-
    (MD >= 1 ; MD = 0),
    (MI >= 1 ; MI = 0),
    CI >= 1,
    MD = MD2,
    CI2 is CI - 1,
    MI2 is MI - 1,
    CD2 is CD + 1.

%un canibal y un misionero en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(1, 1, izquierda)) :-
    (MI >= 1 ; MI = 0),
    (MD >= 1 ; MD = 0),
    CI >= 1,
    MD = MD2,
    CI2 is CI + 1,
    MI2 is MI - 1,
    CD2 is CD - 1.

%un misionero en el bote hacia la derecha
move(state(CI, MI, CD, MD, izquierda), 
     state(CI2, MI2, CD2, MD2, derecha), 
     bote(0, 1, derecha)) :-
    (MD >= 1 ; MD = 0),
    (MI >= 1 ; MI = 0),
    CD >= 1,
    MI = MI2,
    CI2 is CI - 1,
    MD2 is MD + 1,
    CD2 is CD - 1.

%dos canibales en el bote hacia la izquierda
move(state(CI, MI, CD, MD, derecha), 
     state(CI2, MI2, CD2, MD2, izquierda), 
     bote(2, 0, izquierda)) :-
    (MI >= 2 ; MI = 0),
    (MD >= 1 ; MD = 0),
    CI >= 2,
    MD = MD2,
    CI2 is CI + 2,
    MI2 is MI - 2,
    CD2 is CD - 2.

%I extracted the DFS that it uses (below this comment) from: https://github.com/eoni48/si2013/blob/master/prac1/prolog/EjMisioneros.pl

path(State, State,_, []).
path(State1,State2,Visited, [Operator|Operators]) :- 
    move(State1, State3, Operator),
    path(State3,State2, [State3|Visited], Operators).

main :- initial_state(Start),final_state(End), path(Start,End,[Start],Path),
write('Path: '), nl, write(Path).