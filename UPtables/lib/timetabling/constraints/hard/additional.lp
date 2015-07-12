%%% Additional constraints (can be omitted)

:- not { assigned(C,WD,TF) : c(C) } N, weekday(WD, _), timeframe(TF,_), rooms(N).
