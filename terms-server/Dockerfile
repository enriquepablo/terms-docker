FROM debian:jessie

MAINTAINER Enrique Perez Arnaud <enrique@cazalla.net>

RUN apt-get update && apt-get install -y locales \
                                         python3 \
                                         git \
                                         build-essential \
                                         postgresql-server-dev-9.4 \
                                         postgresql-client-9.4 \
                                         inotify-tools

RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd /opt \
    && git clone https://github.com/enriquepablo/terms-project.git

ADD etc/config.cfg /opt/terms-project/config.cfg

RUN apt-get install -y python3-setuptools

RUN cd /opt/terms-project \
    && easy_install-3.4 -U setuptools \
    && python3 bootstrap.py

ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /firstrun

WORKDIR /opt/terms-project

EXPOSE 1967

VOLUME ["/opt/terms-project/var/log"]

RUN apt-get install -y python3-dev

CMD /scripts/start.sh
