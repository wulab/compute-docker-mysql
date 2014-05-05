FROM debian

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install mysql-server-core-5.5 mysql-client-5.5 curl python supervisor cron

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run-mysqld /run-mysqld

EXPOSE 3306

VOLUME ["/mysql"]

CMD ["/usr/bin/supervisord"]
