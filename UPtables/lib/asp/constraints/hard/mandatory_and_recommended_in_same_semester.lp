%%% Mandatory and recommended in same semester
%%% All courses that are mandatory for a given curriculum must be scheduled in different
%%% periods if they are recommended for the same semester
:- assigned(C1,D,P), assigned(C2,D,P), recommendation(C1,S,Cu), recommendation(C2,S,Cu), C1 != C2.
