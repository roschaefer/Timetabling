#language: de
Funktionalität: Semesterempfehlungen
  Als Student möchte ich,
  dass wenn es laut meiner Studienordnung empfohlen ist, bestimmte Lehrveranstaltungen in meinem aktuellen Fachsemester zu belegen, sich diese nicht zeitlich überschneiden,
  weil ich sonst gar nicht gemäß der Studienempfehlung studieren könnte.

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Mittwoch | 10:00 |        |        |
  Und es gibt die Kurse "Prozessorarchitektur" und "Codierungstheorie"
  Und der Kurs "Prozessorarchitektur" hat eine Vorlesung die einmal pro Woche stattfindet
  Und der Kurs "Codierungstheorie" hat eine Vorlesung die einmal pro Woche stattfindet
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"
  Und es gibt Kosten von 7 für Konflikte bei gleicher Semesterempfehlung

  Szenario: Empfohlen in verschiedenen Semestern in derselben Studienordnung
  Angenommen die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Und der Kurs "Codierungstheorie" ist im 5. Semester empfohlen
  Und der Kurs "Prozessorarchitektur" ist im 6. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Und es gibt sogar optimale Lösungen ohne Kosten

  Szenario: Empfohlen im gleichen Semester in derselben Studienordnung
  Angenommen die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 5. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Aber die Kosten für optimale Lösungen betragen 14, weil wir zwei Konflikte haben

  Szenario: Empfohlen im gleichen Semester in verschiedenen Studienordnungen
  Angenommen der Kurs "Prozessorarchitektur" gehört durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Angenommen der Kurs "Codierungstheorie" gehört durch ein Wahlmodul zum Studiengang "Master Informatik"
  Und die Kurse sind beide im 5. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Und es gibt sogar optimale Lösungen ohne Kosten

