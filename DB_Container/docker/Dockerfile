FROM ubuntu

RUN apt-get update

# install mysql 
# To install a package on a system without prompting the user to answer any questions
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

RUN mkdir /var/lib/mysqltmp
RUN mv /var/lib/mysql/* /var/lib/mysqltmp

# open to mount
VOLUME ["/var/lib/mysql", "/var/log/mysql"]


RUN if [ -z "$(ls -A /var/lib/mysql)" ]; then echo 'leer' && cp -r /var/lib/mysqltmp/* /var/lib/mysql; fi

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/#bind-address = 127.0.0.1/" /etc/mysql/mysql.conf.d/mysqld.cnf 

ADD dockerstartup.sh /


# expose MySQL port to a network
EXPOSE 3306


ENTRYPOINT ./dockerstartup.sh && /bin/bash
