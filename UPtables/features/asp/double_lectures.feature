#language: de
  @debug
Funktionalität: Doppelstunden
  Als Dozent möchte ich angeben können,
  dass manche Veranstaltungen in zwei aufeinanderfolgenden Blöcken im gleichen Raum stattfinden,
  weil es aus didaktischen Gründen sinnvoll sein kann, keine langen Unterbrechungen zu haben.

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |            |       | Raum 1 |
    |            |       | 100    |
    | Montag     | 10:00 |        |
    | Montag     | 12:00 |        |
    | Montag     | 14:00 |        |
    | Mittwoch   | 10:00 |        |
    | Mittwoch   | 12:00 |        |
    | Mittwoch   | 14:00 |        |
  Angenommen es gibt den Kurs "Didaktik I"

  Szenario: Einfache Doppelstunde
  Angenommen der Kurs hat zwei wöchentliche Vorlesungen, zusammen als Doppelstunde stattfinden sollen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, weil der Kurs an zwei Tagen jeweils in die ersten beiden Slots platziert werden kann
  Und so sehen die Raumbelegungen aus:
    |            |       | Raum 1  |
    | Montag     | 10:00 | 1       |
    | Montag     | 12:00 | 1 2     |
    | Montag     | 14:00 |   2     |
    | Mittwoch   | 10:00 |     3   |
    | Mittwoch   | 12:00 |     3 4 |
    | Mittwoch   | 14:00 |       4 |
  Und es gibt optimale Lösungen ohne Kosten

  Szenario: Drei Stunden insgesamt, eine Dreierstunde
  Angenommen der Kurs hat drei wöchentliche Vorlesungen insgesamt, die nicht einzeln stattfinden sollen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil der Kurs entweder Montags oder Mittwochs alle Slots belegt
  Und so sehen die Raumbelegungen aus:
    |            |       | Raum 1 |
    | Montag     | 10:00 |  1     |
    | Montag     | 12:00 |  1     |
    | Montag     | 14:00 |  1     |
    | Mittwoch   | 10:00 |     2  |
    | Mittwoch   | 12:00 |     2  |
    | Mittwoch   | 14:00 |     2  |
  Und es gibt optimale Lösungen ohne Kosten

  Szenario: Vier Stunden insgesamt, zwei Doppelstunden
  Angenommen der Kurs hat vier Vorlesungen insgesamt, die als Doppelstunden stattfinden
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, weil der Kurs in zwei Doppelstunden unterteilt werden muss, und ein Tag nur drei Slots hat
  Und so sehen die Raumbelegungen aus:
    |            |       | Raum 1   |
    | Montag     | 10:00 | 1 2      |
    | Montag     | 12:00 | 1 2 3 4  |
    | Montag     | 14:00 |     3 4  |
    | Mittwoch   | 10:00 | 1   3    |
    | Mittwoch   | 12:00 | 1 2 3 4  |
    | Mittwoch   | 14:00 |   2   4  |
  Und es gibt optimale Lösungen ohne Kosten
