#language: de
@debug
Funktionalität: Beschaffenheit von Räumen
Als Student oder Dozent möchte ich,
dass die Ausstattung der Räume bei der Belegung von Veranstaltungen berücksichtigt wird,
sonst können z.B. keine Beamer-Präsentationen oder Computerübungen durchgeführt werden.

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 | Raum 2 | Raum 3 |
    |          |       | 100    | 100    | 100    |
    | Montag   | 10:00 |        |        |        |
  Und es gibt den Kurs "Powerpoint für Anfänger"

  Szenario: Keine geeigneten Räume
  Angenommen der Kurs muss in einem Raum stattfinden, der mit einem Beamer ausgestattet ist
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es keine Lösung, weil es gar keine Räume mit Beamer gibt

  Szenario: Mehrere geeignete Räume
  Angenommen der Kurs muss in einem Raum stattfinden, der mit einem Beamer ausgestattet ist
  Und Raum 2 ist mit einem Beamer ausgestattet
  Und Raum 3 ist mit einem Beamer ausgestattet
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil der Kurs in beiden Räumen stattfinden kann

  Szenario: Anforderungen an einen Raum müssen alle erfüllt sein
  Angenommen der Kurs muss in einem Raum stattfinden, der mit einem Beamer ausgestattet ist
  Und der Kurs muss in einem Raum stattfinden, der über Computerarbeitsplätze verfügt
  Und Raum 2 ist mit einem Beamer ausgestattet
  Und Raum 3 ist mit einem Beamer ausgestattet
  Und Raum 3 ist mit Computerarbeitsplätzen ausgestattet
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es genau eine optimale Lösung, weil es nur einen geeigneten Raum gibt
