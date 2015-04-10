#language: de
Funktionalität: Festgelegte Zeitslots für Veranstaltungen im Informatik-Lehramtstudium (Vorlesungen)

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Montag   | 10:00 |        |        |
    | Mittwoch | 10:00 |        |        |
  Und es gibt den Kurs "Praxis der Programmierung"
  Und es gibt die Studienordnung "Lehramt Informatik Bachelor"
  Und der Kurs ist im Studiengang "Lehramt Informatik Bachelor" Pflicht
  Und der Kurs ist im 1. Semester empfohlen
    
  Szenario: Keine Zeitfenster
  Angenommen der Kurs "Praxis der Programmierung" hat eine Vorlesung die einmal pro Woche stattfindet
  Und es gibt keine Zeitfenster für die Studienordnung "Lehramt Informatik Bachelor"
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Kein zutreffendes Zeitfenster
  Angenommen der Kurs "Praxis der Programmierung" hat eine Vorlesung die einmal pro Woche stattfindet
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 3. Semester
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Mittwoch um 10:00 Uhr für das 5. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, da es keine Zeitfenster für das 1. Semester gibt
  
  Szenario: Zutreffendes Zeitfenster bei einer Übung
  Angenommen der Kurs "Praxis der Programmierung" hat eine wöchentliche Übung
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, da eine Übung nicht zwingend in einem Zeitfenster liegen muss
  
  Szenario: Zutreffendes Zeitfenster bei einer Vorlesung
  Angenommen der Kurs "Praxis der Programmierung" hat eine Vorlesung die einmal pro Woche stattfindet
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, da die Vorlesung nur am Montag 10:00 stattfinden kann
  
  Szenario: Mehrere zutreffende Zeitfenster bei einer Vorlesung
  Angenommen der Kurs "Praxis der Programmierung" hat eine Vorlesung die einmal pro Woche stattfindet
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Mittwoch um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, da die Vorlesung nun sowohl Montags als auch Dienstags 10:00 stattfinden kann
  
  Szenario: Nicht ausreichende Zeitfenster bei mehreren Vorlesungen
  Angenommen der Kurs "Praxis der Programmierung" hat eine Vorlesung die zweimal pro Woche stattfindet
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, da es ein Zeitfenster zu wenig gibt
  
  
  
