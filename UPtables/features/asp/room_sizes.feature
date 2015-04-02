#language: de
Funktionalität: Raumgröße
  Als Student oder Dozent möchte ich,
  dass meine Lehrveranstaltungen in ausreichend großen Räumen stattfinden,
  sonst müssen die Teilnehmer auf dem Boden sitzen und haben keinen Platz zum Schreiben.

  Grundlage:
    Angenommen unser Stundenplan sieht so aus:
      |            |       | Raum 1 | Raum 2 | Raum 3 |
      |            |       |  50    | 100    | 150    |
      | Mittwoch   | 12:00 |        |        |        |
    Angenommen es gibt den Kurs "Didaktik I"

  Szenario: Kurs mit wenigen Teilnehmern
    Angenommen der Kurs hat eine wöchentliche Übung mit 20 Teilnehmern
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 3 optimale Lösungen, denn der Kurs kann in allen Räumen stattfinden
    Und es gibt optimale Lösungen ohne Kosten

  Szenario: Kurs mit vielen Teilnehmern
    Angenommen der Kurs hat eine wöchentliche Übung mit 100 Teilnehmern
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es nur noch 2 optimale Lösungen, denn der Kurs kann jetzt nur noch in zwei Räumen stattfinden
    Und es gibt optimale Lösungen ohne Kosten

  Szenario: Kurs mit viel zu vielen Teilnehmern
    Angenommen der Kurs hat eine wöchentliche Übung mit 200 Teilnehmern
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es genau eine optimale Lösung, weil der Kurs am Besten in den größten Raum gelegt wird
    Aber leider haben optimale Lösungen auf jeden Fall Kosten, weil der Kurs einfach zu groß für unsere Räume ist
