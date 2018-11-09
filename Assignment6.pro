:- use_module(library(lambda)).
 
cbgame :-
	cbgame(Move),
	display(Move).
 

% find solution

cbgame(Moves) :-
	nextMove([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Move).
 
nextMove(_, [_], Lth, Move) :-
	reverse(Lth, Moves).
 
nextMove(Free, Over, Lth, Move) :-
	select(S, Over, Oc1),
	select(O, Oc1, Oc2),
	select(E, Free, F1),
	move(S, O, E),
	nextMove([S, O | F1], [E | Oc2], [move(S,O,E) | Lth], Move).
 
 

% possible moves

move(S,2,E) :- member([S,E], [[1,4], [4,1]]).
move(S,3,E) :- member([S,E], [[1,6], [6,1]]).
move(S,4,E):- member([S,E], [[2,7], [7,2]]).
move(S,5,E):- member([S,E], [[2,9], [9,2]]).
move(S,5,E):- member([S,E], [[3,8], [8,3]]).
move(S,6,E):- member([S,E], [[3,10], [10,3]]).
move(S,5,E):- member([S,E], [[4,6], [6,4]]).
move(S,7,E):- member([S,E], [[4,11], [11,4]]).
move(S,8,E):- member([S,E], [[4,13], [13,4]]).
move(S,8,E):- member([S,E], [[5,12], [12,5]]).
move(S,9,E):- member([S,E], [[5,14], [14,5]]).
move(S,9,E):- member([S,E], [[6,13], [13,6]]).
move(S,10,E):- member([S,E], [[6,15], [15,6]]).
move(S,8,E):- member([S,E], [[9,7], [7,9]]).
move(S,9,E):- member([S,E], [[10,8], [8,10]]).
move(S,12,E):- member([S,E], [[11,13], [13,11]]).
move(S,13,E):- member([S,E], [[12,14], [14,12]]).
move(S,14,E):- member([S,E], [[15,13], [13,15]]).
 
 

% print solution

display(Sol) :-
	display(Sol, [1]).

display([], Free) :-
	numlist(1,15, Lth),
	maplist(\X^I^(member(X, Free) -> I = 0; I = 1),Lth,
	[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),

display([move(Up, Take, Down) | Last], Free) :-
	numlist(1,15, Lth),
	maplist(\X^I^(member(X, Free) -> I = 0; I = 1),Lth,
	[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	select(Down, Free, F1),
	display(Last,  [Up, Take | F1]).