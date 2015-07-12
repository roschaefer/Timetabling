%%% Conflicts: Lectures of courses in the same curriculum or taught by
%%% the same teacher must be all scheduled in different periods. Two
%%% conflicting lectures in the same period represent one
%%% violation. Three conflicting lectures count as 3 violations: one
%%% for each pair.

:- not { assigned(C,WD,TF) : course_component(C,T,_,_,_,_) } 1, t(T), weekday(WD,_), timeframe(TF,_).
