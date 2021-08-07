#!/usr/bin/sh

echo "Backing up sna database..."
pg_dump -U postgres -c -b -f sna > sna-postgres/data.sql
echo "Removing volume: "
docker volume rm sna_pgdata

echo "Database dumped to sna-postgres/data.sql"
echo "Run docker-compose build and docker-compose up to run with default database."