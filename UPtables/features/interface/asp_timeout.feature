#language: de
Funktionalität: Time out für die Suche nach optimalen Lösungen
Als Planer möchte ich,
einen Time out einstellen können, nach dem die Suche nach optimalen Lösungen abgebrochen wird,
um je nach Situation schnellere oder bessere Ergebnisse zu bekommen.

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
    Und es gibt 10 Kurse in der Datenbank
    Und alle Kurse gehören zur selben Studienordnung
    Und es gibt 5 Räume mit jeweils 10 Plätzen in der Datenbank


  Szenario: Meldung wird nicht angezeigt, wenn keine Lösungen vorhanden sind
    Wenn ich auf die Stundenplan Seite gehe
    Und es keine Stundenpläne gibt
    Dann sollte auch keine Meldung vorhanden sein, dass keine optimale Lösung gefunden wurde

  Szenario: Eine Sekunde Time out
    Wenn ich auf die Stundenplan Seite gehe
    Und ich einen Time out von einer Sekunde einstelle
    Und die Suche starte
    Dann habe ich nach kaum mehr als einer Sekunde schon Ergebnisse
    Aber wie ich sehe, wurde keine optimale Lösung gefunden
