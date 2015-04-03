#language: de
Funktionalität: Unverfügbarkeit von Lehrkräften

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 |
    |          |       | 100    | 150    |
    | Montag   | 10:00 |        |        |
    | Mittwoch | 10:00 |        |        |
  Und es gibt den Kurs "Face Recognition"
  Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
  Und die Vorlesung des Kurses "Face Recognition" hat einen Termin und wird von Prof. "Scheffer" unterrichtet
  
  Szenario: Lehrer hat keine Unverfügbarkeiten
  Angenommen Prof. "Scheffer" hat keine Unverfügbarkeiten
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 4 optimale Lösungen
  
  Szenario: Lehrer hat eine Unverfügbarkeit
  Angenommen Prof. "Scheffer" ist am Montag um 10:00 Uhr unverfügbar
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen
  
  Szenario: Lehrer ist komplett Unverfügbar
  Angenommen Prof. "Scheffer" ist am Montag um 10:00 Uhr unverfügbar
  Und Prof. "Scheffer" ist am Mittwoch um 10:00 Uhr unverfügbar
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung
  
  
  
  
  
