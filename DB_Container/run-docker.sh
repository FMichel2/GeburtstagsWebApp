#/bin/bash


docker run --rm -it -v /Users/fmichel/Desktop/test/GeburtstagsWebApp_Kopie/DB_Container/Database:/var/lib/mysql/ -v /Users/fmichel/Desktop/test/GeburtstagsWebApp_Kopie/DB_Container//log:/var/log/mysql -p 3306:3306 --name  geburtstagskalenderdb geburtstagskalenderdb:2.0

