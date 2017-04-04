FROM swift

RUN apt-get update

# install vapor

RUN apt-get -q update
RUN apt-get -q install -y wget software-properties-common python-software-properties apt-transport-https
RUN wget -q https://repo.vapor.codes/apt/keyring.gpg -O- | apt-key add -
RUN echo "deb https://repo.vapor.codes/apt $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/vapor.list
RUN apt-get -q update
RUN apt-get update
RUN apt-get install vapor -y

RUN apt-get install libmysqlclient-dev -y
RUN mkdir GebKalenderBackend

VOLUME ["/GebKalenderBackend/"]

RUN apt-get -y install mysql-client

ADD dockerstartup.sh /

ENTRYPOINT ./dockerstartup.sh && /bin/bash
