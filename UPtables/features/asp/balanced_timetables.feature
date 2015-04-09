# language: de
Funktionalität: Ausgeglichene Stundenpläne
  Als Student möchte ich,
  dass ich pro Tag nicht zu wenige und nicht zu viele Termine habe,
  um eine angenehme Lernbelastung zu erreichen.

  Szenario: Einzelner Kurs
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
    Und alle Kurse gehören zur selben Studienordnung
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
    Und es gibt 9 optimale Lösungen insgesamt

  Szenario: Zwei Kurse in der selben Studienordnung
    Angenommen unser Stundenplan sieht so aus:
      |            |       | Raum 1 |
      |            |       | 100    |
      | Montag     | 10:00 |        |
      | Montag     | 11:00 |        |
      | Montag     | 12:00 |        |
      | Dienstag   | 10:00 |        |
      | Dienstag   | 11:00 |        |
      | Dienstag   | 12:00 |        |
    Und es gibt die Kurse "Programmiertechnik I" und "Elektrotechnik II"
    Und die Kurse haben 2 Übungen pro Woche
    Und alle Kurse gehören zur selben Studienordnung
    Wenn jetzt nach Stundenplänen gesucht wird
    Und die gefundenen, optimalen Lösungen sortiert werden
    Dann sieht die erste Lösung so aus:
      |          |       | Raum 1               |
      |          |       | 100                  |
      | Montag   | 10:00 | Programmiertechnik I |
      | Montag   | 11:00 | Programmiertechnik I |
      | Montag   | 12:00 |                      |
      | Dienstag | 10:00 | Elektrotechnik II    |
      | Dienstag | 11:00 | Elektrotechnik II    |
      | Dienstag | 12:00 |                      |
    Und es gibt 12 optimale Lösungen insgesamt
