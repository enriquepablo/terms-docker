
Terms Dockerization
===================

Dockerfiles to run Terms in containers.

terms-basic
-----------

The easiest way to have a taste of
Terms, just run the container (in the foreground) with::

  $ docker run -i -t enriquepablo/terms-basic:0.1 terms

And you will be presented with a Terms command line interface.

terms-server
------------

In the terms-server directory you can find the files needed to run a
container with a terms server with a PostgreSQL backend.
To run it, clone this repository and run docker-compose::

  $ git clone https://github.com/enriquepablo/terms-docker.git
  $ cd terms-docker/terms-server
  $ docker-compose up

The container will have a terms daemon listening on port 1967. For details on
how to communicate with the daemon, see the `Terms docs <http://terms.readthedocs.org/en/latest/protocol.html>`_.
The pg data should be exposed in `data`, the pg logs in `logs`.
To change the configuration for the terms server, you can edit `etc/terms.cfg`
and then rebuild the image.

terms-notebook
--------------

This extends the setup described above under the "terms-server" title
with a container with a `jupyter notebook <http://jupyter.org>`_, that
communicates with the terms-server container. Run it with::

  $ git clone https://github.com/enriquepablo/terms-docker.git
  $ cd terms-docker/terms-jupyter
  $ docker-compose up

And then visit http://localhost:8888 in a web browser.
