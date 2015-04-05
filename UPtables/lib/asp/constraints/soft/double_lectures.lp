%%% DoubleLectures: Some courses require that lectures in the same day
%%% are grouped together (double lectures). For a course that requires
%%% grouped lectures, every time there is more than one lecture in one
%%% day, a lecture non-grouped to another is not allowed. Two lectures
%%% are grouped if they are adjacent and in the same room. Each
%%% non-grouped lecture counts as 1 violation.

#const penalty_of_double_lectures = 3.

penalty("DoubleLecture", assigned(C,R,D,TF), penalty_of_double_lectures) :-
  course_component(C,_,_,_,1), d(D),
  assigned(C,R,D,TF),
  timeframe(TF, TIME),
  not assigned(C,R,D,TF1),
  timeframe(TF1, TIME - 1),
  not assigned(C,R,D,TF2),
  timeframe(TF2, TIME + 1).
