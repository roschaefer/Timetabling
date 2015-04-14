%%% Mandatory and recommended in same semester
%%% All courses that are mandatory for a given curriculum must be scheduled in different
%%% periods if they are recommended for the same semester

% not more than one mandatory lecture at one time (recommended in same semester)
:- not { assigned(C,WD,TF) : recommendation(C,S,Cu), mandatory(C,Cu), course_component(C,_,_,_,_,lecture) } 1, semester(S), cu(Cu), weekday(WD,_), timeframe(TF,_).

% not one mandatory lecture and at least one tutorial at one time (recommended in same semester)
:- 1 { assigned(C,WD,TF) : recommendation(C,S,Cu), mandatory(C,Cu), course_component(C,_,_,_,_,lecture) } 1,
   1 { assigned(C,WD,TF) : recommendation(C,S,Cu), mandatory(C,Cu), course_component(C,_,_,_,_,tutorial) },
   semester(S), cu(Cu), weekday(WD,_), timeframe(TF,_).

%%% or if they are recommended for the first three semester, to ensure that students
%%% of the third semester can repeat the courses of the first semester

% not more than one mandatory lecture at one time (recommended in different semester)
:- not { assigned(C,WD,TF) : recommendation(C,1..3,Cu), mandatory(C,Cu), course_component(C,_,_,_,_,lecture) } 1, cu(Cu), weekday(WD,_), timeframe(TF,_).