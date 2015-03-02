#language: de
Funktionalität: Menü für Kurse: Semesterempfehlung aussprechen
Als Lehrkraft möchte ich,
für meine Kurse eine Empfehlung ausschreiben, in welchem Semester man diese am besten belegt, und zwar nach Studienordnung getrennt,
damit ich eine Aussage über den Anspruch und die Voraussetzungen gegenüber den Studenten treffen kann.


Grundlage:
  Angenommen es gibt den Kurs "Ruby Programmierung"
  Und es gibt die Studienordnung "Bachelor Informatik"
  Und der Kurs gehört zur Studienordnung "Bachelor Informatik"

@javascript
Szenario: Kurs bekommt neue Empfehlung
  Wenn ich den Kurs bearbeiten möchte
  Und den Kurs für die Studienordnung "Bachelor Informatik" im 2. Semester empfehle
  Und dann speichere
  Dann ist in der Datenbank der Kurs im 2. Semester im Studiengang "Bachelor Informatik" empfohlen

@javascript
Szenario: Keine doppelten Empfehlungen für die gleiche Studienordnung
  Wenn ich den Kurs bearbeiten möchte
  Und den Kurs für die Studienordnung "Bachelor Informatik" im 2. Semester empfehle
  Aber den Kurs für die Studienordnung "Bachelor Informatik" auch im 3. Semester empfehle
  Und dann versuche zu speichern
  Dann sehe ich Validierungsfehler
  Und der Kurs hat keine Empfehlung für irgendeine Studienordnung
