#/bin/bash


docker run --rm -itd -v $(pwd)/Database:/var/lib/mysql/ -v $(pwd)/log:/var/log/mysql -p 3306:3306 --name  geburtstagskalenderdb geburtstagskalenderdb:2.0

