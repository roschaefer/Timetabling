%%% Balanced timetable:
%%% All courses of a given curriculum should be evenly distributed throughout the week.
%%% A violation counts if the number of scheduled courses in a day exceeds the necessary
%%% minimum according to the pigeon hole principle.
%%% The difference is subsequently multiplied with the penalty of this constraint.

#const penalty_of_balanced_timetable = 1.

penalty("BalancedTimetable", assigned_courses_per_day(Cu, WD, N), (N - MAX)*penalty_of_balanced_timetable) :-
  weekday(WD, _),
  cu(Cu),
  N = { assigned(CC,WD,TF) : curricula(Cu,CC) , timeframe(TF, _) },
  pigeon_hole_maximum(Cu, MAX),
  N > MAX.


