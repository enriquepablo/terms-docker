
Terms Dockerization
===================

To create an environment to run Terms in docker containers, clone this repository and execute::

  $ git clone https://github.com/enriquepablo/terms-docker.git
  $ cd terms-docker
  $ ./start.sh

Now you should be able to access a terms server at http://terms.server/, and log in as admin:admin.

There will be a container with a terms daemon listening on port 172.19.67.101:1967. For details on
how to communicate with the daemon, see the `Terms docs <http://terms.readthedocs.org/en/latest/protocol.html>`_.
The postgresql data should be exposed in `data`, the logs in `log` in the root directory.
To change the configuration for the different containers, you can edit the files under `etc/`
and then restart the environment.
