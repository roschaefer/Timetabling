#language: de
Funktionalität: Sperrzeiten für Studienordnungen

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 |
    |          |       | 100    |
    | Montag   | 10:00 |        |
    | Mittwoch | 10:00 |        |
  Und es gibt den Kurs "Face Recognition"
  Und es gibt die Studienordnungen "Bachelor Informatik" und "Master Informatik"
  Und der Kurs gehört zum Studiengang "Bachelor Informatik"
  Und der Kurs gehört zum Studiengang "Master Informatik"
  Und für diesen Test deaktivieren wir die Soft Constraints

  Szenario: Keine Sperrzeiten
  Angenommen keine Studienordnung hat irgendwelche Sperrzeiten
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 Lösungen, weil der Kurs in zwei mögliche Slots gelegt werden kann

  Szenario: Eine Studienordnung hat eine Sperrzeit
  Angenommen der Studiengang "Bachelor Informatik" hat eine Sperrzeit am Montag um 10:00 Uhr
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es genau eine Lösung, weil der Kurs nur in einen Slot gelegt werden kann

  Szenario: Beide Studienordnung haben Sperrzeiten
  Angenommen der Studiengang "Bachelor Informatik" hat eine Sperrzeit am Montag um 10:00 Uhr
  Und der Studiengang "Master Informatik" hat eine Sperrzeit am Mittwoch um 10:00 Uhr
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, weil kein Slot mehr übrig ist
