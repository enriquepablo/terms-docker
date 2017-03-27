#!/bin/bash

# Stop on error
set -e

export PGPASSWORD="terms"

until psql -h "postgresql" -U "terms" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

if [[ -e /firstrun ]]; then

  echo "Running zc.buildout..."
  echo $( /opt/terms-project/bin/buildout 2>&1 )

  echo "Initializing knowledge base..."
  echo $( /opt/terms-project/bin/initterms -c /opt/terms-project/etc/terms.cfg 2>&1 )

  echo "Finishing first run..."
  rm /firstrun
fi

# Start Terms
echo "Starting Terms Server..."
cd /opt/terms-project
/opt/terms-project/bin/kbdaemon start 2>&1
