FROM ubuntu

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install mysql-server-core-5.5 mysql-client-core-5.5

ADD ./run-mysqld /run-mysqld
EXPOSE 3306
CMD ["/run-mysqld"]