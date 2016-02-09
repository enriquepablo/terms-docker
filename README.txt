
Terms Dockerization
===================

Dockerfiles to run Terms in containers.

terms-server
------------

In the terms-server directory you can find the files needed to run a
container with a terms server with a PostgreSQL backend.
The needed images are already in the docker hub, so all that is needed is
to run docker-compose in that directory::

  $ docker-compose up

The pg data should be exposed in `data`, the pg logs in `logs`.
To change the configuration for the terms server, you can edit `etc/terms.cfg`
and then rebuild the image.
