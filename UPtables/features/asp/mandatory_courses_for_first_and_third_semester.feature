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

  Szenario: Überschneidungen von Vorlesungen bei Pflichtveranstaltungen in des ersten Semestern
    Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
    Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
    Und der Kurs "Cluster Computing" ist im 3. Semester empfohlen
    Und alle Kurse haben eine wöchentliche Vorlesung
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es keine Lösung, weil der wiederholende Student unbedingt beide Vorlesungen besuchen muss
    
    Szenario: Überschneidungen von Vorlesung und Übung bei Pflichtveranstaltungen in des ersten Semestern
      Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
      Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
      Und der Kurs "Cluster Computing" ist im 3. Semester empfohlen
      Und der Kurs "Mikroprozessortechnik" hat eine Vorlesung die einmal pro Woche stattfindet
      Und der Kurs "Cluster Computing" hat eine Übung die einmal pro Woche stattfindet
      Wenn jetzt nach Stundenplänen gesucht wird
      Dann gibt es 2 optimale Lösungen, weil der wiederholende Student im Normalfall auf andere Übungstermine ausweichen kann
      Aber leider haben optimale Lösungen Kosten, weil beide Veranstaltungen im selben Studiengang und im selben Semester empfohlen sind    
  
  Szenario: Überschneidungen von Übungen bei Pflichtveranstaltungen in des ersten Semestern
    Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
    Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
    Und der Kurs "Cluster Computing" ist im 3. Semester empfohlen
    Und alle Kurse haben eine wöchentliche Übung
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 2 optimale Lösungen, weil der wiederholende Student im Normalfall auf andere Übungstermine ausweichen kann
    Aber leider haben optimale Lösungen Kosten, weil beide Veranstaltungen im selben Studiengang und im selben Semester empfohlen sind    
      
  Szenario: Überschneidungen von Pflichtveranstaltungen des ersten und höheren Semestern möglich
    Angenommen die Kurse sind beides Pflichtveranstaltungen im Studiengang "Bachelor Informatik"
    Und der Kurs "Mikroprozessortechnik" ist im 1. Semester empfohlen
    Und der Kurs "Cluster Computing" ist im 5. Semester empfohlen
    Und alle Kurse haben eine wöchentliche Vorlesung
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 2 optimale Lösungen
    Aber leider haben optimale Lösungen Kosten, wegen Überschneidungen im gleichen Studiengang

