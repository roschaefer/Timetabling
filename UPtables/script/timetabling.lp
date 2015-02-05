%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Curriculum-Based Course Timetabling
%
% @author Mutsunori Banbara
% @author Naoyuki Tamura
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HARD CONSTRAINTS (channeling encoding)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c(C) :- course(C,_,_,_,_,_).
t(T) :- course(_,T,_,_,_,_).
r(R) :- room(R,_,_).
d(0..D-1) :- days(D).
ppd(0..P-1) :- periods_per_day(P).
cu(Cu) :- curricula(Cu,_).

%%% Lectures: All lectures of a course must be scheduled, and they
%%% must be assigned to distinct periods. A violation occurs if a
%%% lecture is not scheduled or two lectures are in the same period.

N { assigned(C,D,P) : d(D), ppd(P) } N :- course(C,_,N,_,_,_).

%%% Conflicts: Lectures of courses in the same curriculum or taught by
%%% the same teacher must be all scheduled in different periods. Two
%%% conflicting lectures in the same period represent one
%%% violation. Three conflicting lectures count as 3 violations: one
%%% for each pair.

:- not { assigned(C,D,P) : course(C,T,_,_,_,_) } 1, t(T), d(D), ppd(P).
:- not { assigned(C,D,P) : curricula(Cu,C) } 1, cu(Cu), d(D), ppd(P).

%%% RoomOccupancy: Two lectures can not take place in the same room in
%%% the same period. Two lectures in the same room at the same period
%%% represent one violation. Any extra lecture in the same period and
%%% room counts as one more violation.

1 { assigned(C,R,D,P) : r(R) } 1 :- assigned(C,D,P).
:- not { assigned(C,R,D,P) : c(C) } 1, r(R), d(D), ppd(P).

%%% Availability: If the teacher of the course is not available to
%%% teach that course at a given period, then no lecture of the course
%%% can be scheduled at that period. Each lecture in a period
%%% unavailable for that course is one violation.

:- assigned(C,D,P), course(C,T,_,_,_,_), professor_unavailable(T,D,P).

%%% Additional constraints (can be omitted)

:- not { assigned(C,D,P) : c(C) } N, d(D), ppd(P), rooms(N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%#hide.
#show assigned/4.
%#show penalty/3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COST of SOFT CONSTRAINTS (UD1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#const penalty_of_room_capacity = 1.
#const penalty_of_min_working_days = 5.
#const penalty_of_isolated_lectures = 1.

%%% RoomCapacity: For each lecture, the number of students that attend
%%% the course must be less than or equal the number of seats of all
%%% the rooms that host its lectures. Each student above the capacity
%%% counts as 1 point of penalty. The weight for this component is 1.

penalty("RoomCapacity",assigned(C,R,D,P),(N-Cap)*penalty_of_room_capacity) :- 
	assigned(C,R,D,P),
	course(C,_,_,_,N,_),
	room(R,Cap,_),
	N > Cap.

%%% MinWorkingDays: The lectures of each course must be spread into a
%%% given minimum number of days. Each day below the minimum counts as
%%% 1 violation.

working_day(C,D) :- assigned(C,D,P).

penalty("MinWorkingDays",course(C,MWD,N),(MWD-N)*penalty_of_min_working_days) :- 
	course(C,_,_,MWD,_,_),
	N = #count {1,D : working_day(C,D)},
	N < MWD.

%%% IsolatedLectures (Compactness v.1): Lectures belonging to a
%%% curriculum should be adjacent to each other (i.e., in consecutive
%%% periods). For a given curriculum we account for a violation every
%%% time there is one lecture not adjacent to any other lecture within
%%% the same day. Each isolated lecture in a curriculum counts as 1
%%% violation.

scheduled_curricula(Cu,D,P) :- assigned(C,D,P), curricula(Cu,C).

penalty("IsolatedLectures",isolated_lectures(Cu,D,P),penalty_of_isolated_lectures) :- 
	scheduled_curricula(Cu,D,P),
	not scheduled_curricula(Cu,D,P-1),
	not scheduled_curricula(Cu,D,P+1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MINIMIZE THE SUM OF PENALTIES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#minimize {P,N,V : penalty(N,V,P)}.

% End
