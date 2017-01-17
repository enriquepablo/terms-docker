FROM debian:jessie

MAINTAINER Enrique Perez Arnaud <enrique@cazalla.net>

RUN apt-get update && apt-get install -y locales \
                                         python \
                                         python-dev \
                                         python-pip \
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
    && git clone https://github.com/enriquepablo/tserve-buildout.git

RUN rm -f /opt/tserve-buildout/config.cfg
ADD etc/config.cfg /opt/tserve-buildout/config.cfg


RUN cd /opt/tserve-buildout \
    && pip install --upgrade setuptools \
    && python bootstrap.py

ADD scripts /scripts
ADD ../../wait-for-it.sh /scripts/wait-for-it.sh
RUN chmod +x /scripts/try.sh /scripts/wait-for-it.sh /scripts/start.sh

RUN touch /firstrun

WORKDIR /opt/tserve-buildout

EXPOSE 8080

VOLUME ["/opt/tserve-buildout/var/log"]

CMD /scripts/try.sh
