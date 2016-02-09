FROM debian:jessie

MAINTAINER Enrique Perez Arnaud <enrique@cazalla.net>

RUN apt-get update && apt-get install -y locales \
                                         inotify-tools \
                                         python3

RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN mkdir /data

ADD terms.cfg /etc/terms.cfg

RUN apt-get install -y python3-setuptools

RUN easy_install-3.4 Terms

RUN initterms

VOLUME ["/data"]
