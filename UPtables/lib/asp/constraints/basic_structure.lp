name("Universität Potsdam").


c(C) :- course(C,_,_,_,_,_).
t(T) :- course(_,T,_,_,_,_).
r(R) :- room(R,_,_).
d(0..D-1) :- days(D).
ppd(0..P-1) :- periods_per_day(P).
cu(Cu) :- curricula(Cu,_).
semester(S) :- recommendation(_, S, _).

#minimize {P,N,V : penalty(N,V,P)}.
