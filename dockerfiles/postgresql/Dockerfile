FROM postgres:9.6


ENV POSTGRES_USER terms
ENV POSTGRES_PASSWORD terms
ENV PGDATA /var/lib/postgresql/data/pgdata
ENV POSTGRES_DB terms

VOLUME ["/var/lib/postgresql/data/pgdata"]

RUN mkdir -p /docker-entrypoint-initdb.d/

ADD scripts/init-2nd-db.sh /docker-entrypoint-initdb.d/init-2nd-db.sh
