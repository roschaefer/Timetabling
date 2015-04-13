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
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"

  Szenario: Überschneidung von Vorlesungen bei Pflichtveranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Vorlesung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, weil beide Vorlesungen zwingend besucht werden müssen
  
  Szenario: Überschneidung von Vorlesung und Übung bei Pflichtveranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Und der Kurs "Face Recognition" hat eine Vorlesung die einmal pro Woche stattfindet
  Und der Kurs "Cluster Computing" hat eine Übung die einmal pro Woche stattfindet
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, weil die Übung aufgrund der Vorlesung von keinem Studenten im 4. Semester mehr besucht werden kann

  Szenario: Überschneidung von Übungen bei Pflichtveranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"  
  Und die Kurse sind beide im 4. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Übung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil es im Normalfall Ausweichtermine für Übungen gibt
  Aber leider haben optimale Lösungen Kosten, weil beide Veranstaltungen im selben Studiengang und im selben Semester empfohlen sind
  
  Szenario: Wählbare Veranstaltungen mit gleicher Semesterempfehlung
  Angenommen die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Und die Kurse sind beide im 4. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Vorlesung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Aber leider haben optimale Lösungen Kosten, weil beide Veranstaltungen im selben Studiengang und im selben Semester empfohlen sind

  Szenario: Pflichtveranstaltungen mit unterschiedlicher Semesterempfehlung
  Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
  Und der Kurs "Face Recognition" ist im 4. Semester empfohlen
  Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Vorlesung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Aber leider haben optimale Lösungen Kosten, wegen Überschneidungen im gleichen Studiengang

  Szenario: Wählbare Veranstaltungen mit unterschiedlicher Semesterempfehlung
  Angenommen die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "Bachelor Informatik"
  Und der Kurs "Face Recognition" ist im 4. Semester empfohlen
  Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Vorlesung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Und es gibt optimale Lösungen ohne Kosten, weil die Kurse weder Pflicht noch empfohlen für das gleiche Semester sind

  @requires_optimization_report
  Szenario: Pflichtveranstaltungen unterschiedlicher Studienordnungen
  Angenommen der Kurs "Face Recognition" ist im Studiengang "Bachelor Informatik" Pflicht
  Und der Kurs "Cluster Computing" ist im Studiengang "Master Informatik" Pflicht
  Und die Kurse sind beide im 4. Semester empfohlen
  Und alle Kurse haben eine wöchentliche Vorlesung
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  Und es gibt sogar optimale Lösungen ohne Kosten


