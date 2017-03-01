#!/bin/sh

if [ ! -f docker-compose.yml ]; then
    echo "Run $0 from the terms-docker top level directory"
    exit 1
fi

#
# Set up entrys in /etc/hosts for the containers with externally accessible services
#
( printf "172.19.67.103\tterms.server\n";
) \
    | while read line; do
    if ! grep -q "^${line}$" /etc/hosts; then
	echo "$0: Adding line '${line}' to /etc/hosts"
	if [ "x`whoami`" = "xroot" ]; then
	    echo "${line}" >> /etc/hosts
	else
	    echo "${line}" | sudo tee -a /etc/hosts
	fi
    else
	echo "Line '${line}' already in /etc/hosts"
    fi
done

export COMPOSE_HTTP_TIMEOUT=180

docker-compose rm -f --all
docker-compose up $*
