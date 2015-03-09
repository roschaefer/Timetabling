%%% Curriculum unavailabilities: If a curriculum is unavailable for a given timeslot
%%% no courses of this curriculum should be scheduled in this timeslot
%%% 

#const penalty_of_curriculum_unavailabilities = 10.

:- assigned(C,D,P), curricula(Cu, C), curriculum_unavailable(Cu,D,P).

