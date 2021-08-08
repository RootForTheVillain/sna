#!/usr/bin/sh

echo "Backing up sna database..."
# $ pg_dump -U postgres -b -v -o sna > sna-postgres/data.sql

pg_dumpall > sna-postgres/data.sql


pg_dump -h localhost -U postgres -v -b -Fp -c sna > sna-postgres/data-clean.sql
	

echo "Removing volume: "
docker volume rm sna_pgdata

echo "Database dumped to sna-postgres/data.sql"
echo "Run docker-compose build and docker-compose up to run with default database."
echo "Building and starting API and Postgres containers..."

docker-compose build
docker-compose up



pg_dump --blobs --verbose --no-privileges --no-owner \
--username postgres sna  \
--file "sna-postgres/data_$(date +%Y%m%d).sql"