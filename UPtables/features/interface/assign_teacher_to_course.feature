#language: de
Funktionalität: Zuordnung zwischen Lehrkäften und Kursen
  Als Planer möchte ich,
  die Zuordnungen von Kursen zu Lehrkräften ändern können,
  damit z.B. wenn eine Zuordnung im Hokus System fehlte (etwa wegen eines neuen Mitarbeiters), diese im Timetabling System nachgetragen werden kann und bei der Berechnung der Stundenpläne berücksichtigt wird.


  Szenario: Kurs erhält neue Lehrkraft
    Angenommen es gibt einen Kurs, der schon von einem Lehrer geleitet wird
    Und es gibt noch einen anderen Lehrer in der Datenbank
    Wenn ich auf die Seite vom Kurs gehe
    Und den ursprünglichen Lehrer gegen den anderen austausche
    Dann sollte der Kurs in der Datenbank dem neuen Lehrer zugeordnet sein
