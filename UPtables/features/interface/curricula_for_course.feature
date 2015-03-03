#language: de
Funktionalität: Anzeigen der einem Kurs zugeordneten Studienordnungen
  Als Planer möchte ich,
  auf der Seite eines Kurses die zugeordneten Studienordnungen sehen
  um überprüfen zu können ob es Überschneidungen von Kursen der gleichen Studienordnung gab

  Szenario: Studienordnungen anzeigen
  Angenommen es gibt den Kurs "Deklaratives Problemlösen"
  Und es gibt die Studienordnungen "B.Sc. Informatik", "M.Sc. Informatik" und "Computational Science"
  Und es gibt die Module "Logische Programmierung" und "Komplexitätstheorie"
  Und die Zuordnung von Lehrveranstaltungen und Modulen sieht so aus:
    |                           | Logische Programmierung | Komplexitätstheorie |
    | Deklaratives Problemlösen | X                       | X                   |
  Und die Zuordnung von Modulen und Studienordnungen sieht so aus:
    |                         | B.Sc. Informatik | M.Sc. Informatik | Computational Science |
    | Logische Programmierung |                  | X                | X                     |
    | Komplexitätstheorie     | X                |                  | X                     |
  Wenn ich auf die Seite des Kurses gehe
  Dann möchte ich die Studienordnungen "B.Sc. Informatik", "M.Sc. Informatik" und "Computational Science" sehen
