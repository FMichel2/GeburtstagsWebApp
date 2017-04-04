# Uebungsprojekt Geburtstagskalender Datenbank
Hier befindet sich die Datenbank damit auch alle Personen und ihre Geburtstage gespeichert werden können.

## 1. Datenbank Struktur:

Name der Datenbank: Gebkalender

Tabellenname : persons (wird vom Backend angelegt)

Tabellenstruktur (wird vom Backend angelegt) :

Field     | Type              | Null | Key | Default | Extra
--------- | ----------------- | ---- | --- | ------- | ---------------
id        | int(10) unsigned  | NO   | PRI | NULL    | auto_increment 
name      | varchar(255)      | NO   |     | NULL    |                
gebTag    | int(11)           | NO   |     | NULL    |                
gebMonat  | int(11)           | NO   |     | NULL    |                
gebJahr   | int(11)           | NO   |     | NULL    |                



