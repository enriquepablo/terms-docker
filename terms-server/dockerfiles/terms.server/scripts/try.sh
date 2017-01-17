#!/usr/bin/env bash


/scripts/wait-for-it.sh terms:1967 -s -t 3600 -- /scripts/start.sh
