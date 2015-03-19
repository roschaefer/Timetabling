%%% Availability: If the teacher of the course is not available to
%%% teach that course at a given period, then no lecture of the course
%%% can be scheduled at that period. Each lecture in a period
%%% unavailable for that course is one violation.

:- assigned(C,D,P), course_component(C,T,_,_,_,_), professor_unavailable(T,D,P).
