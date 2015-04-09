#language: de
Funktionalität: Festgelegte Zeitslots für Veranstaltungen im Informatik-Lehramtstudium (Vorlesungen)

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Montag   | 10:00 |        |        |
    | Mittwoch | 10:00 |        |        |
  Und es gibt den Kurs "Praxis der Programmierung"
  Und es gibt die Studienordnung "Lehramt Informatik Bachelor"
  Und der Kurs "Praxis der Programmierung" ist im Studiengang "Lehramt Informatik Bachelor" Pflicht
  Und der Kurs "Praxis der Programmierung" ist im 1. Semester empfohlen
    
  Szenario: Keine Zeitfenster
  Angenommen der Kurs "Praxis der Programmierung" besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin
  Und es gibt keine Zeitfenster für die Studienordnung "Lehramt Informatik Bachelor"
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Kein zutreffendes Zeitfenster
  Angenommen der Kurs "Praxis der Programmierung" besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 3. Semester
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Mittwoch um 10:00 Uhr für das 5. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Zutreffendes Zeitfenster bei einer Übung
  Angenommen der Kurs "Praxis der Programmierung" besitzt eine Komponente vom Typ "Übung" mit genau 1 Termin
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Mehrere zutreffende Zeitfenster bei einer Vorlesung
  Angenommen der Kurs "Praxis der Programmierung" besitzt eine Komponente vom Typ "Vorlesung" mit genau 1 Termin
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Mittwoch um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Nicht ausreichende Zeitfenster bei einer Vorlesung
  Angenommen der Kurs "Praxis der Programmierung" besitzt eine Komponente vom Typ "Vorlesung" mit genau 2 Terminen
  Und "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung
  
  
  
