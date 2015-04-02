#language: de
Funktionalität: Pflichtveranstaltungen
  Als Student möchte ich,
  dass es keine zeitlichen Überschneidungen von Veranstaltungen gibt, die für meine Studienordnung in einem bestimmten Semester Pflicht sind,
  sonst könnte ich mein Studium gar nicht in Regelstudienzeit schaffen.

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Mittwoch | 10:00 |        |        |
  Und es gibt die Kurse "Face Recognition" und "Cluster Computing"
  Und der Kurs "Face Recognition" besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin
  Und der Kurs "Cluster Computing" besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"

  Szenario: Pflichtveranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, weil sich die Kurse nicht überschneiden dürfen

  Szenario: Wählbare Veranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Aber leider haben optimale Lösungen Kosten, weil beide Veranstaltungen im selben Studiengang und im selben Semester empfohlen sind

  Szenario: Pflichtveranstaltungen mit unterschiedlicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und der Kurs "Face Recognition" ist im 4. Semester empfohlen
  Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Aber leider haben optimale Lösungen Kosten, wegen Überschneidungen im gleichen Studiengang
  
  @requires_optimization_report
  Szenario: Pflichtveranstaltungen unterschiedlicher Studienordnungen
  Angenommen der Kurs "Face Recognition" ist im Studiengang "Bachelor Informatik" Pflicht
  Und der Kurs "Cluster Computing" ist im Studiengang "Master Informatik" Pflicht
  Und die Kurse sind beide im 4. Semester empfohlen
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Und es gibt sogar optimale Lösungen ohne Kosten


