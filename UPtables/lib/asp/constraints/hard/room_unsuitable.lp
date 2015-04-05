%%% Room unsuitable:
%%% Courses must not take place in rooms that happen to be unsuitable for the given course
%%% because of missing equipment; beamer, computer pools etc

:- assigned(C,R,_,_), room_unsuitable(R,C).
