#language: de
Funktionalität: Pflichtveranstaltungen
  Als Student möchte ich,
  dass es keine zeitlichen Überschneidungen von Veranstaltungen gibt, die für meine Studienordnung in einem bestimmten Semester Pflicht sind,
  sonst könnte ich mein Studium gar nicht in Regelstudienzeit schaffen.

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    | Mittwoch | 10:00 |        |        |
  Und es gibt die Kurse "Face Recognition" und "Cluster Computing"
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"

  Szenario: Pflichtveranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Dann gibt es keine Lösung, weil sich die Kurse nicht überschneiden dürfen

  Szenario: Pflichtveranstaltungen mit unterschiedlicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und der Kurs "Face Recognition" ist im 4. Semester empfohlen
  Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
  Dann gibt es genau eine Lösung
  Aber diese Lösung hat gewisse Kosten wegen Überschneidungen im gleichen Studiengang

  Szenario: Pflichtveranstaltungen unterschiedlicher Studienordnungen
  Angenommen der Kurs "Face Recognition" ist im Studiengang "Bachelor Informatik" Pflicht
  Und der Kurs "Cluster Computing" ist im Studiengang "Master Informatik" Pflicht
  Und die Kurse sind beide im 4. Semester empfohlen
  Dann gibt es genau eine Lösung
  Und diese Lösung hat sogar gar keine Kosten, weil es keine Überschneidungen gibt


