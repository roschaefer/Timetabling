%%% Same curriculum and mandatory
%%% All courses that are mandatory for a given curriculum should not be scheduled at the
%%% same time

#const penalty_of_same_curriculum_and_mandatory = 1.

penalty("SameCurriculumAndMandatory", conflicting_course_components(C1,C2,Cu), penalty_of_same_curriculum_and_mandatory) :-
    assigned(C1,D,P),
    assigned(C2,D,P),
    mandatory(C1,Cu),
    mandatory(C2,Cu),
    C1 != C2.
