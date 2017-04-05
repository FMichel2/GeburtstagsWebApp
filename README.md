# Uebungsprojekt Geburtstagskalender

Dieses kleine Projekt wurde erstellt, um mich ein wenig in Swift (Vapor Backand Framework) und Docker einzuarbeiten.

## 1. Was macht dieses Projekt?
Dieses Pojekt beinhaltet eine Myqsl-Datenbank, die Personen zusammen mit ihren Geburtstagen Speichert und ein Backend, dass mit der Datenbank verbunden ist, Personen anlegen/auslesen kann und eine Html-Seite ausliefert
        
Die Datenbank und das Beckend laufen in seperaten Docker Containern.

# 2. Wie starte ich dieses Projekt?

## 2.1 Docker-Images bauen lassen:
Um die Datenbank und das Backend zum laufen zu bringen, müssen wir zuerst unsere Docker-Images bauen lassen.
Dies passiert mit dem ausführen der jeweiligen buils-image.sh Datein.
```
./buils-image.sh
```
In den jeweiligen Ordnern {Dein-Projekt-Pfad}/DB_Container/docker und {Dein-Projekt-Pfad}/Backend/docker


## 2.2 Docker-Container laufen lassen:
Nachdem unsere Images gebaut wurden, können wir uns daraus Container erstellen und diese laufen lassen.
Alles was man dafür tun muss, ist die jeweiligen run-docker.sh Datein starten.
```
./run-docker.sh
```
In {Dein-Projekt-Pfad}/DB_Container und Dein-Projekt-Pfad}/Backend.

NOTE: zuerst den DB_Container starten damit das Backend darauf zugreifen kann!

# 3. Wie benutze ich dieses Projekt?
Zur benutzung öffnet man einfach einene beliebugen Browser und geht auf localhost:8080

![Startseite](/pictures_for_readme/main.png)

Nun kann man auf der Rechten seite die Daten der Anzulegenden Person eingeben.
Nach einem Klick auf "Person Anlegen" erscheint eine Meldung (wenn die Person erfolgreich gespeichert wurde)

![Person Anlegen](/pictures_for_readme/person_anlegen.png)

Will man sich Personen ausgeben lassen, die in einem bestimmtem zeitraum geburtstag haben, wählt man einfach ein anfangs Datum (Von:) und ein and Datum (Bis:) aus und klickt danach auf "Personen Anzeigen".
Es werden alle Personen angezeigt die in dieser Zeitspanne Geburtstag haben.
![Personen Anzeigen](/pictures_for_readme/personen_anzeigen.png)
