#language: de
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

  Szenario: Doppelstunden
  Angenommen es gibt den Kurs "Didaktik I"
  Und der Kurs hat eine wöchentliche Vorlesung als Doppelstunde
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen, weil der Kurs an zwei Tagen jeweils in die ersten beiden Slots platziert werden kann
