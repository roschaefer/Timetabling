%%% DoubleLectures: Some courses require that lectures in the same day
%%% are grouped together (double lectures). For a course that requires
%%% grouped lectures, every time there is more than one lecture in one
%%% day, a lecture non-grouped to another is not allowed. Two lectures
%%% are grouped if they are adjacent and in the same room. Each
%%% non-grouped lecture counts as 1 violation.

#const penalty_of_double_lectures = 3.



joined_time_assignment(C,R,D,TF,TIME) :- assigned(C,R,D,TF), timeframe(TF,TIME).
penalty("DoubleLecture", joined_time_assignment(C,R,D,TF,TIME), penalty_of_double_lectures) :-
  course_component(C,_,_,_,1), d(D),
  joined_time_assignment(C,R,D,TF, TIME),
  not joined_time_assignment(C,R,D,_, TIME-1),
  not joined_time_assignment(C,R,D,_, TIME+1).
