%%% Mandatory and recommended in same semester
%%% All courses that are mandatory for a given curriculum must be scheduled in different
%%% periods if they are recommended for the same semester

:- not { assigned(C,D,P) : recommendation(C,S,Cu) } 1, semester(S), cu(Cu), d(D), ppd(P).


