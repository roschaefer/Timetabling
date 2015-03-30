#language: de
Funktionalität: Anzeige des Stundenplans

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 |
    |          |       | 100    |
    | Montag   | 10:00 |        |
  Und es gibt den Kurs "Face Recognition"
  Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
  
  @requires_optimization_report
  Szenario:
  Wenn ich auf die Stundenplan Seite gehe
  Und die Suche starte
  Dann gibt es genau eine optimale Lösung
  Und es ich kann mir den ersten Stundenplan ansehen
