name("Universität Potsdam").


% we will use the actual time of the weekday and the timeframe respectively as the global id
% there is a one-to-one correspondance (bijection) between id and global id
ppd(P) :- timeframe(_,P).
d(D)   :- weekday(_,D).

c(C) :- course_component(C,_,_,_,_).
t(T) :- course_component(_,T,_,_,_).
r(R) :- room(R,_,_).
cu(Cu) :- curricula(Cu,_).
semester(S) :- recommendation(_, S, _).

#minimize {P,N,V : penalty(N,V,P)}.
