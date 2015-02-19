#language: de
Funktionalität: Neue Räume hinzufügen
  Als Planer möchte ich,
  neue Räume zu den Eingangsdaten hinzufügen können,
  z.B. wenn mir seitens der Universität ein ganz unbekannter Raum (z.B. im Zweitzugriffsrecht) freigegeben wird.



  Szenario: Raum hinzufügen
    Angenommen es gibt noch keinen Raum in der Datenbank
    Wenn ich einen neuen Raum erzeugen will
    Und ich diese Daten eintrage und speichere
      | Name     | H06 |
      | Capacity | 56  |
    Dann gibt es genau einen Raum in der Datenbank
    Und dieser Raum hat 56 Sitzplätze
