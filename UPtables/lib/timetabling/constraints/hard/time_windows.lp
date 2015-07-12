%%% Time windows: If there are time windos for a specific curriculum 
%%% and a specific semester and the curriculum has a mandatory lecture,
%%% recommended for the specific semester, the lecture must be scheduled 
%%% within one time window

:- assigned(C,WD,TF), course_component(C,_,_,_,_,lecture), mandatory(C,Cu), recommendation(C,S,Cu),
     1 { time_window(_,_,Cu,S) }, not time_window(WD,TF,Cu,S).