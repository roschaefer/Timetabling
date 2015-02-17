%%% Additional constraints (can be omitted)

:- not { assigned(C,D,P) : c(C) } N, d(D), ppd(P), rooms(N).
