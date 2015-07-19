name("Universität Potsdam").



c(C) :- course_component(C,_,_,_,_,_).
t(T) :- course_component(_,T,_,_,_,_).
r(R) :- room(R,_).
cu(Cu) :- curricula(Cu,_).
semester(S) :- recommendation(_, S, _).
