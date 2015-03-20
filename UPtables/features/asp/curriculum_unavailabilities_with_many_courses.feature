#language: de
Funktionalität: Sperrzeiten für Studienordnungen

  Grundlage:
  Angenommen unser Stundenplan sieht so aus:
    |          |       | Raum 1 |
    |          |       | 100    |
    | Montag   | 10:00 |        |
    | Mittwoch | 10:00 |        |
    | Freitag  | 10:00 |        |
  Und es gibt den Kurs "Face Recognition"
  Und der Kurs hat eine Vorlesung die einmal pro Woche stattfindet
  Und es gibt die zwei Studienordnungen "Bachelor Informatik" und "Master Informatik"
  Und der Kurs gehört zum Studiengang "Bachelor Informatik"
  Und der Kurs gehört zum Studiengang "Master Informatik"

  Szenario: Fremde Kurse sind nicht betroffen
  Angenommen es gibt den Kurs "Computer Vision"
  Und der Kurs "Computer Vision" hat eine Vorlesung die einmal pro Woche stattfindet
  Und der Kurs "Computer Vision" gehört zum Studiengang "Bachelor Informatik"
  Angenommen der Studiengang "Master Informatik" hat eine Sperrzeit am Mittwoch um 10:00 Uhr
  Und der Studiengang "Master Informatik" hat eine Sperrzeit am Freitag um 10:00 Uhr
  Wenn jetzt nach Stundenplänen gesucht wird
  Dann gibt es 2 optimale Lösungen, weil "Face Recognition" nur in einen und "Computer Vision" in zwei mögliche Slots gelegt werden kann



