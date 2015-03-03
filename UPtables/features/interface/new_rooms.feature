#language: de
Funktionalität: Neue Räume hinzufügen
  Als Planer möchte ich,
  neue Räume zu den Eingangsdaten hinzufügen können,
  z.B. wenn mir seitens der Universität ein ganz unbekannter Raum (z.B. im Zweitzugriffsrecht) freigegeben wird.

  Grundlage:
    Angenommen es gibt die Wochentage Montag, Dienstag, Mittwoch, Donnerstag und Freitag
    Und es gibt die Zeitslots
       |  Von  -  Bis  |
       | 08:00 - 10:00 |
       | 10:00 - 12:00 |
       | 12:00 - 14:00 |
       | 14:00 - 16:00 |
       | 16:00 - 18:00 |
       | 18:00 - 20:00 |
       | 20:00 - 22:00 |

  Szenario: Raum hinzufügen
    Angenommen es gibt noch keinen Raum in der Datenbank
    Wenn ich einen neuen Raum erzeugen will
    Und ich diese Daten eintrage und speichere
      | Name     | H06 |
      | Capacity | 56  |
    Dann gibt es genau einen Raum in der Datenbank
    Und dieser Raum hat 56 Sitzplätze


  Szenario: Raum im Zweitzugriffsrecht für bestimmte Zeitslots erhalten
    Angenommen ich habe Hörsaal 10 im Zweitzugriffsrecht für Montag um 10:00-12:00 Uhr bekommen
    Wenn ich Hörsaal 10 als Raum hinzufügen möchte
    Und ich diese Daten eintrage
      | Name     | H10 |
      | Capacity | 200 |
    Und außerdem diese Unverfügbarkeiten angebe
      |               | Montag | Dienstag | Mittwoch | Donnerstag | Freitag |
      | 08:00 - 10:00 | X      | X        | X        | X          | X       |
      | 10:00 - 12:00 | frei!  | X        | X        | X          | X       |
      | 12:00 - 14:00 | X      | X        | X        | X          | X       |
      | 14:00 - 16:00 | X      | X        | X        | X          | X       |
      | 16:00 - 18:00 | X      | X        | X        | X          | X       |
      | 18:00 - 20:00 | X      | X        | X        | X          | X       |
      | 20:00 - 22:00 | X      | X        | X        | X          | X       |
    Und dann speichere
    Dann sollte der Raum H10 genau 200 Plätze haben
    Und er ist frei am Montag zwischen 10:00 und 12:00 Uhr
    Aber er ist belegt am Montag zwischen 08:00 und 10:00 Uhr
    Und er ist belegt am Freitag zwischen 10:00 und 12:00 Uhr
