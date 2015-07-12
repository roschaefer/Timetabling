%%% Recommended semester
%%% Two courses that are recommended for the same semester should not be
%%% be scheduled in the same time slot

#const penalty_of_recommended_semester = 7.

penalty("RecommendedSemester", conflicting_courses_with_recommended_semester(C1,C2,S,Cu), penalty_of_recommended_semester) :-
    assigned(C1,D,P),
    assigned(C2,D,P),
    recommendation(C1,S,Cu),
    recommendation(C2,S,Cu),
    C1 != C2.
