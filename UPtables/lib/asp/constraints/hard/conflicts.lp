%%% Conflicts: Lectures of courses in the same curriculum or taught by
%%% the same teacher must be all scheduled in different periods. Two
%%% conflicting lectures in the same period represent one
%%% violation. Three conflicting lectures count as 3 violations: one
%%% for each pair.

:- not { assigned(C,D,P) : course(C,T,_,_,_,_) } 1, t(T), d(D), ppd(P).
:- not { assigned(C,D,P) : curricula(Cu,C) } 1, cu(Cu), d(D), ppd(P).
