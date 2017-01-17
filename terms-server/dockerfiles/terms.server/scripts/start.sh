#!/usr/bin/env bash

# Stop on error
set -e

./checkterms.sh

if [[ -e /firstrun ]]; then

  echo "Running zc.buildout..."
  echo $( /opt/tserve-buildout/bin/buildout 2>&1 )

  echo "Initializing knowledge base..."
  echo $( /opt/tserve-buildout/bin/initterms -c /opt/tserve-buildout/etc/terms.cfg 2>&1 )

  echo "Finishing first run..."
  rm /firstrun
fi

# Start Terms
echo "Starting Terms Server..."
cd /opt/tserve-buildout

exec start-stop-daemon --start --exec \
      /opt/tserve-buildout/bin/webserver -- -c /opt/tserve-buildout/etc/terms.cfg
