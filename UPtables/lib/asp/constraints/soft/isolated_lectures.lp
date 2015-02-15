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
