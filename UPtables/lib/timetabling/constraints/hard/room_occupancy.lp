%%% RoomOccupancy: Two lectures can not take place in the same room in
%%% the same period. Two lectures in the same room at the same period
%%% represent one violation. Any extra lecture in the same period and
%%% room counts as one more violation.

1 { assigned(C,R,WD,TF) : r(R) } 1 :- assigned(C,WD,TF).
:- not { assigned(C,R,WD,TF) : c(C) } 1, r(R), weekday(WD,_), timeframe(TF,_).
