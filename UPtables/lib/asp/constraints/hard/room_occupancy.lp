%%% RoomOccupancy: Two lectures can not take place in the same room in
%%% the same period. Two lectures in the same room at the same period
%%% represent one violation. Any extra lecture in the same period and
%%% room counts as one more violation.

1 { assigned(C,R,D,P) : r(R) } 1 :- assigned(C,D,P).
:- not { assigned(C,R,D,P) : c(C) } 1, r(R), d(D), ppd(P).
