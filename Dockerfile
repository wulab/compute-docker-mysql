FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install mysql-server-core-5.5 mysql-client-core-5.5 curl python supervisor cron

RUN curl -s -O https://dl.google.com/dl/cloudsdk/release/artifacts/gcutil-1.12.0.tar.gz
RUN tar xzf gcutil-1.12.0.tar.gz
RUN ln -s gcutil-1.12.0 gcutil
RUN rm gcutil-1.12.0.tar.gz

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./run-mysqld /run-mysqld
ADD ./take-snapshot /etc/cron.hourly/take-snapshot

EXPOSE 3306

VOLUME ["/mysql"]

CMD ["/usr/bin/supervisord"]