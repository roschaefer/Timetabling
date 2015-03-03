%%% Same curriculum
%%% All courses that are mandatory for a given curriculum should not be scheduled at the
%%% same time

#const penalty_of_same_curriculum = 1.

penalty("SameCurriculum", conflicting_courses(C1,C2,Cu), penalty_of_same_curriculum) :-
    assigned(C1,D,P),
    assigned(C2,D,P),
    curricula(Cu,C1),
    curricula(Cu,C2),
    C1 != C2.
