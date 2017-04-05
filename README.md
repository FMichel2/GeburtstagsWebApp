# Uebungsprojekt Geburtstagskalender

Dieses kleine Projekt wurde erstellt, um mich ein wenig in Swift (Vapor Backand Framework) und Docker einzuarbeiten.

## 1. Was macht dieses Projekt?
Dieses Pojekt beinhaltet: 
        eine Myqsl-Datenbank die Personen und ihre Geburtstage Speichert.
        ein Backend das mit der Datenbank verbunden ist, Personen anlegen/auslesen kann und eine Html-Seite ausliefert
        
Die Datenbank und das Beckend laufen in seperaten Docker Containern.

# 2. Wie starte ich dieses Projekt?

## 2.1 Docker-Images bauen lassen:
Um die Datenbank und das Backend zum laufen zu bringen müssen wier zuerst unsere Docker-Images bauen lassen.
Dies passiert mit dem ausführen der jeweiligen buils-image.sh Datein ({Dein-Projekt-Pfad}/DB_Container/docker und {Dein-Projekt-Pfad}/Backend/docker).

## 2.2 Docker-Container laufen lassen:
Nachdem unsere Images gebaut wurden können wir uns daraus Container erstellen und diese laufen lassen.
Alles was man dafür tun muss, ist die jeweiligen run-docker.sh Datein starten ({Dein-Projekt-Pfad}/DB_Container und Dein-Projekt-Pfad}/Backend).

NOTE: zuerst den DB_Container starten damit das Backend darauf zugreifen kann!

# 3. Wie benutze ich dieses Projekt?
Zur benutzung öffnet man einfach einene beliebugen Browser und geht auf localhost:8080

![Alt text](/pictures_for_readme/main.jpg)
