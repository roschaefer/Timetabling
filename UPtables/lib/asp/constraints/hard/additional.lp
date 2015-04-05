%%% Additional constraints (can be omitted)

:- not { assigned(C,D,TF) : c(C) } N, d(D), timeframe(TF,_), rooms(N).
