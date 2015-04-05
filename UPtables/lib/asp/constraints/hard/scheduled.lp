%%% Lectures: All lectures of a course must be scheduled, and they
%%% must be assigned to distinct periods. A violation occurs if a
%%% lecture is not scheduled or two lectures are in the same period.

N { assigned(C,WD,TF) : weekday(WD,_), timeframe(TF,_) } N :- course_component(C,_,N,_,_).
