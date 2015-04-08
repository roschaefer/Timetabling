#language: de
Funktionalität: Festgelegte Zeitslots für Veranstaltungen im Informatik-Lehramtstudium (Vorlesungen)

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Montag   | 10:00 |        |        |
    | Mittwoch | 10:00 |        |        |
  Und es gibt den Kurs "Praxis der Programmierung"
  Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
  Und es gibt die Studienordnung "Lehramt Informatik Bachelor"
  Und der Kurs "Praxis der Programmierung" ist im Studiengang "Lehramt Informatik Bachelor" Pflicht
  Und der Kurs "Praxis der Programmierung" ist im 1. Semester empfohlen
    
  Szenario: Keine Zeitfenster
  Angenommen es gibt keine Zeitfenster für die Studienordnung "Lehramt Informatik Bachelor"
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Kein zutreffendes Zeitfenster
  Angenommen "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 3. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Ein zutreffendes Zeitfenster
  Angenommen "Lehramt Informatik Bachelor" hat ein Zeitfenster am Montag um 10:00 Uhr für das 1. Semester
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  
  
  
  
  
  
