#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE terms_data;
    GRANT ALL PRIVILEGES ON DATABASE terms_data TO terms;
EOSQL
