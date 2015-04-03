#language: de
Funktionalität: Pflichtveranstaltungen der niedrigen Semester
  Als Student möchte ich,
  dass es keine Überschneidungen von Pflichtveranstaltungen des ersten und dritten Semesters gibt,
  damit ich im dritten Semester die Pflichtveranstaltungen des ersten Semesters wiederholen kann.

  Grundlage:
    Angenommen unser Stundenplan sieht so aus:
      |            |       | Raum 1 | Raum 2 |
      |            |       | 100    | 150    |
      | Mittwoch   | 10:00 |        |        |
    Und es gibt die Kurse "Mikroprozessortechnik" und "Cluster Computing"
    Und es gibt die Studienordnung "Bachelor Informatik"
    Und alle Kurse haben eine wöchentliche Vorlesung

  Szenario: Keine Überschneidungen von Pflichtveranstaltungen in des ersten Semestern
    Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
    Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
    Und der Kurs "Cluster Computing" ist im 3. Semester empfohlen
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es keine Lösung, weil es hier unbedingt möglich sein soll, Kurse des ersten Semesters zu wiederholen

  Szenario: Überschneidungen von Pflichtveranstaltungen des ersten und höheren Semestern möglich
    Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
    Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
    Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 2 optimale Lösungen
    Aber leider haben optimale Lösungen Kosten, wegen Überschneidungen im gleichen Studiengang

