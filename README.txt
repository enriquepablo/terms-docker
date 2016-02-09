
Terms Dockerization
===================

Dockerfiles to run Terms in containers.

terms-basic
-----------

A simple container with a sqlite store. The easiest way to have a taste of
Terms, just run the container (in the foreground) with::

  $ docker run -i -t enriquepablo/terms-basic:0.1 terms

terms-server
------------

In the terms-server directory you can find the files needed to run a
container with a terms server with a PostgreSQL backend.
The needed images are already in the docker hub, so all that is needed is
to clone this repository and run docker-compose::

  $ git clone https://github.com/enriquepablo/terms-docker.git
  $ cd terms-docker/terms-server
  $ docker-compose up

The container will have a terms daemon listening on port 1967. For details on
how to communicate with the daemon, see the `Terms docs <http://terms.readthedocs.org/en/latest/protocol.html>`_.
The pg data should be exposed in `data`, the pg logs in `logs`.
To change the configuration for the terms server, you can edit `etc/terms.cfg`
and then rebuild the image.
