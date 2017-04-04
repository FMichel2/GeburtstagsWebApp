FROM swift

RUN apt-get update

# install vapor
RUN curl -sL toolbox.qutheory.io | sh
RUN apt-get install libmysqlclient-dev -y
RUN mkdir GebKalenderBackend

VOLUME ["/GebKalenderBackend/"]

RUN apt-get -y install mysql-client

ADD dockerstartup.sh /

ENTRYPOINT ./dockerstartup.sh && /bin/bash
