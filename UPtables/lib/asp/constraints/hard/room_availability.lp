%%% Room Availability: If a room is unavailable during a certain time,
%%% lectures must not be held in this room at that time.
:- assigned(C,R,D,P), room_unavailable(R,D,P).
