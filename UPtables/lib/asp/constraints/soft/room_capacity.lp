%%% RoomCapacity: For each lecture, the number of students that attend
%%% the course must be less than or equal the number of seats of all
%%% the rooms that host its lectures. Each student above the capacity
%%% counts as 1 point of penalty. The weight for this component is 1.

#const penalty_of_room_capacity = 1.

penalty("RoomCapacity",assigned(C,R,D,P),(N-Cap)*penalty_of_room_capacity) :- 
	assigned(C,R,D,P),
	course_component(C,_,_,N,_),
	room(R,Cap,_),
	N > Cap.
