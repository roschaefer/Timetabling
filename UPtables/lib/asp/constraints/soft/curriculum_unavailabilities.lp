%%% Curriculum unavailabilities: If a curriculum is unavailable for a given timeslot
%%% no courses of this curriculum should be scheduled in this timeslot
%%% 

#const penalty_of_curriculum_unavailabilities = 10.

penalty("CurriculumUnavailability", curricula(Cu,Course), penalty_of_curriculum_unavailabilities) :-
assigned(C,D,P), has_component(Course, C), curricula(Cu, Course), curriculum_unavailable(Cu,D,P).

