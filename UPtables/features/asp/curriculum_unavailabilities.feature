#language: de
Funktionalität: Sperrzeiten für Studienordnungen

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 |
    |          |       | 100    |
    | Montag   | 10:00 |        |
    | Mittwoch | 10:00 |        |
  Und es gibt den Kurs "Face Recognition"
  Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"
  Und der Kurs gehört zum Studiengang "Bachelor Informatik"
  Und der Kurs gehört zum Studiengang "Master Informatik"
  Und der Kurs besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin

  
  @requires_optimization_report
  Szenario: Keine Sperrzeiten
  Angenommen keine Studienordnung hat irgendwelche Sperrzeiten
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil der Kurs in zwei mögliche Slots gelegt werden kann
  Und es gibt optimale Lösungen ohne Kosten

  Szenario: Eine Studienordnung hat eine Sperrzeit
  Angenommen der Studiengang "Bachelor Informatik" hat eine Sperrzeit am Montag um 10:00 Uhr
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es genau eine optimale Lösung, weil der Kurs nur in einen Slot gelegt werden kann
  Und es gibt optimale Lösungen ohne Kosten

  Szenario: Beide Studienordnung haben Sperrzeiten
  Angenommen der Studiengang "Bachelor Informatik" hat eine Sperrzeit am Montag um 10:00 Uhr
  Und der Studiengang "Master Informatik" hat eine Sperrzeit am Mittwoch um 10:00 Uhr
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil die Zuordnung wieder egal geworden ist
  Aber leider haben optimale Lösungen auf jeden Fall Kosten
