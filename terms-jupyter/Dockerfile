
FROM debian:jessie

MAINTAINER Enrique Pérez Arnaud <enrique@cazalla.net>

RUN apt-get update && apt-get install -y locales \
                                         python3 \
                                         python3-dev \
                                         python3-pip \
                                         libzmq3-dev \
                                         build-essential \
                                         inotify-tools

RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

EXPOSE 8888

RUN pip3 install jupyter

VOLUME /root

WORKDIR /root

ADD terms /root/terms

ADD terms_kernel.py /root/

RUN jupyter kernelspec install /root/terms

CMD jupyter notebook --no-browser --ip 0.0.0.0
