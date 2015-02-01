name("Universität Potsdam").

courses(2).
rooms(8).
days(5).
periods_per_day(7).
curricula(1).

% min_max_daily_lectures(2,3).
unavailabilityconstraints(0).
roomconstraints(0).

course("Theoretische Informatik I","Christoph Kreitz",3,3,30,0).
course("Mathematik II Vorlesung","Sebastian Reich",1,3,100,0).
course("Intelligente Datenanalyse","Tobias Scheffer",4,2,20,0).

room("0.02",32,"03.04").
room("0.03",32,"03.04").
room("0.04",32,"03.04").
room("1.02",32,"03.04").
room("1.03",32,"03.04").
room("2.01",16,"03.04").
room("2.14",12,"03.04").
room("H01",100,"03.06").

curricula("MSc. Informatik","Theoretische Informatik I").
curricula("BSc. Informatik","Mathematik II Vorlesung").
curricula("BSc. Informatik","Theoretische Informatik I").
curricula("BSc. Informatik","Intelligente Datenanalyse").
