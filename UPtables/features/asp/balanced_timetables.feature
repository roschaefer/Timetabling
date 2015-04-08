# language: de
Funktionalität: Ausgeglichene Stundenpläne
  Als Student möchte ich,
  dass ich pro Tag nicht zu wenige und nicht zu viele Termine habe,
  um eine angenehme Lernbelastung zu erreichen.

  Grundlage:
    Angenommen unser Stundenplan sieht so aus:
      |            |       | Raum 1 |
      |            |       | 100    |
      | Montag     | 10:00 |        |
      | Montag     | 11:00 |        |
      | Montag     | 12:00 |        |
      | Dienstag   | 10:00 |        |
      | Dienstag   | 11:00 |        |
      | Dienstag   | 12:00 |        |
      | Mittwoch   | 10:00 |        |
      | Mittwoch   | 11:00 |        |
      | Mittwoch   | 12:00 |        |
    Und es gibt den Kurs "Programmiertechnik I"
    Und der Kurs hat 3 Übungen pro Woche
    Und es gibt die Studienordnung "Bachelor Informatik"
    Und der Kurs gehört zur Studienordnung "Bachelor Informatik"

  Szenario:
    Wenn jetzt nach Stundenplänen gesucht wird
    Und die gefundenen, optimalen Lösungen sortiert werden
    Dann sieht die erste Lösung so aus:
      |          |       | Raum 1               |
      |          |       | 100                  |
      | Montag   | 10:00 | Programmiertechnik I |
      | Montag   | 11:00 |                      |
      | Montag   | 12:00 |                      |
      | Dienstag | 10:00 | Programmiertechnik I |
      | Dienstag | 11:00 |                      |
      | Dienstag | 12:00 |                      |
      | Mittwoch | 10:00 | Programmiertechnik I |
      | Mittwoch | 11:00 |                      |
      | Mittwoch | 12:00 |                      |
