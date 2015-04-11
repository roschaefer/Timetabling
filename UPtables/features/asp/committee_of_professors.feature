#language: de
Funktionalität: Gremientage
  Als Professor möchte ich,
  dass meine Kollegen und ich einen Zeitslot frei haben, in dem wir uns bei Bedarf treffen können,
  wenn z.B. Gremientage anstehen.


  Grundlage:
    Angenommen wir aktivieren den Constraint für Gremientage

  Szenario: Bei einer Vorlesung gibt es bei diesem Stundenplan keine Auswirkungen
    Angenommen unser Stundenplan sieht so aus:
      |          |       | Raum 1 | Raum 2 |
      |          |       | 100    | 150    |
      | Montag   | 10:00 |        |        |
      | Mittwoch | 10:00 |        |        |
    Angenommen es gibt den Kurs "Face Recognition"
    Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
    Und die Vorlesung wird von Prof. "Scheffer" gehalten
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 4 optimale Lösungen, denn egal wann die Vorlesung stattfindet, der jeweils andere Zeitslot ist möglicher Gremiumstag

  Szenario: Bei zwei Vorlesungen müssen bei diesem Stundenplan beide gleichzeitig stattfinden
    Angenommen unser Stundenplan sieht so aus:
      |          |       | Raum 1 | Raum 2 |
      |          |       | 100    | 150    |
      | Montag   | 10:00 |        |        |
      | Mittwoch | 10:00 |        |        |
    Angenommen es gibt die Kurse "Face Recognition" und "Multimedia-Technologie"
    Und alle Kurse haben eine wöchentliche Vorlesung
    Und die Vorlesung für "Face Recognition" wird von Prof. "Scheffer" gehalten
    Und die Vorlesung für "Multimedia-Technologie" wird von Prof. "Lucke" gehalten
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 4 optimale Lösungen, weil ein Zeitslot wegen des Gremiumtages verbraucht wird

  Szenario: Zwei Vorlesungen unterschiedlicher Lehrer und ein Lehrer ohne Vorlesung ist unverfügbar
    Angenommen unser Stundenplan sieht so aus:
      |          |       | Raum 1 | Raum 2 |
      |          |       | 100    | 150    |
      | Montag   | 10:00 |        |        |
      | Mittwoch | 10:00 |        |        |
      | Freitag  | 10:00 |        |        |
    Angenommen es gibt die Kurse "Face Recognition" und "Multimedia-Technologie"
    Und alle Kurse haben eine wöchentliche Vorlesung
    Und die Vorlesung für "Face Recognition" wird von Prof. "Scheffer" gehalten
    Und die Vorlesung für "Multimedia-Technologie" wird von Prof. "Lucke" gehalten
    Und es gibt einen Professor namens "IchHab KeineZeit"
    Und Prof. "KeineZeit" ist am Freitag um 10:00 Uhr unverfügbar
    Wenn jetzt nach Stundenplänen gesucht wird
    Dann gibt es 4 optimale Lösungen, weil je ein Zeitslot verbraucht wird wegen des Gremiumtages und der Unverfügbarkeit

  Szenario: Wann gibt es mögliche Gremientage?
    Angenommen unser Stundenplan sieht so aus:
      |          |       | Raum 1 | Raum 2 |
      |          |       | 100    | 150    |
      | Montag   | 10:00 |        |        |
      | Mittwoch | 10:00 |        |        |
      | Freitag  | 10:00 |        |        |
    Angenommen es gibt den Kurs "Face Recognition"
    Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
    Wenn jetzt nach Stundenplänen gesucht wird
    Und die gefundenen, optimalen Lösungen sortiert werden
    Dann gibt es bei der ersten Lösung einen Gremiumtag am Mittwoch 10:00
    Und es gibt bei der ersten Lösung einen Gremiumtag am Freitag 10:00

