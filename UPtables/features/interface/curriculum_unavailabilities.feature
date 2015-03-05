#language: de
Funktionalität: Reservierte Zeiten für bestimmte Semester anderer Fakultäten
  Als Planer möchte ich,
  dass ich semesterspezifisch angeben kann, wenn eine externe Studienordnung eine Sperrzeit hat,
  weil die Wahrscheinlichkeit hoch ist, dass in dieser Zeit an anderen Fakultäten relevante Pflichtveranstaltungen gehalten werden.

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

  Szenario: Sperrzeiten für Studienordnungen angeben
    Angenommen es gibt die Studienordnung "Master Informatik"
    Wenn ich die Studienordnung editiere
    Und ich diese Sperrzeiten für die Studienordnung angebe
      |               | Montag | Dienstag | Mittwoch | Donnerstag | Freitag |
      | 08:00 - 10:00 | OK     | OK       | OK       | OK         | OK      |
      | 10:00 - 12:00 | OK     | X        | X        | OK         | OK      |
      | 12:00 - 14:00 | OK     | X        | X        | OK         | OK      |
      | 14:00 - 16:00 | OK     | X        | X        | OK         | OK      |
      | 16:00 - 18:00 | OK     | OK       | OK       | OK         | OK      |
      | 18:00 - 20:00 | OK     | OK       | OK       | OK         | OK      |
      | 20:00 - 22:00 | OK     | OK       | OK       | OK         | OK      |
    Und dann speichere
    Dann dürfen Kurse dieser Studienordnung auf den ganzen Montag gelegt werden
    Aber es dürfen keine Kurse am Dienstag um 10:00 - 12:00 Uhr stattfinden
    Und es dürfen keine Kurse am Mittwoch um 14:00 - 16:00 Uhr stattfinden
