%%% If there is a certain time when all professors are free, this slot can be used
%%% to have a professors committee. We must have at least one such slot.

committee_date(WD, TF) :-
  timeframe(TF, _), weekday(WD, _),
  not assigned(_, WD, TF),
  not professor_unavailable(_, WD, TF).

:- not committee_date(_, _).
