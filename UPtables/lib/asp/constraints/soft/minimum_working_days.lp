%%% MinWorkingDays: The lectures of each course must be spread into a
%%% given minimum number of days. Each day below the minimum counts as
%%% 1 violation.

working_day(C,D) :- assigned(C,D,P).

penalty("MinWorkingDays",course(C,MWD,N),(MWD-N)*penalty_of_min_working_days) :- 
	course(C,_,_,MWD,_,_),
	N = #count {1,D : working_day(C,D)},
	N < MWD.
