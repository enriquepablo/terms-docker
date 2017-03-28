FROM debian:jessie

MAINTAINER Enrique Perez Arnaud <enrique@cazalla.net>

RUN apt-get update && apt-get install -y locales \
                                         python3 \
                                         python3-dev \
                                         python3-pip \
                                         python3-numpy \
                                         python3-scipy \
                                         python3-numexpr \
                                         python3-matplotlib \
                                         git \
                                         build-essential \
                                         postgresql-server-dev-9.4 \
                                         postgresql-client-9.4 \
                                         inotify-tools

RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd /opt \
    && git clone https://github.com/enriquepablo/terms-project.git

ADD etc/config.cfg /opt/terms-project/config.cfg


RUN cd /opt/terms-project \
    && pip3 install --upgrade "setuptools==34.3.3" \
    && python3 bootstrap.py

ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /firstrun

WORKDIR /opt/terms-project

EXPOSE 1967

VOLUME ["/opt/terms-project/var/log", "/opt/terms-project/etc"]

CMD /scripts/start.sh
