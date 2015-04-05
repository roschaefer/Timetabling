%%% Curriculum unavailabilities: If a curriculum is unavailable for a given timeslot
%%% no courses of this curriculum should be scheduled in this timeslot
%%% 

#const penalty_of_curriculum_unavailabilities = 10.

penalty("CurriculumUnavailability", curricula(Cu,C), penalty_of_curriculum_unavailabilities) :-
assigned(C,WD,TF), curricula(Cu, C), curriculum_unavailable(Cu,WD,TF).

