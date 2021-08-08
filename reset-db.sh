#!/usr/bin/sh

echo "Backing up sna database..."
# $ pg_dump -U postgres -b -v -O -x sna > sna-postgres/pg_dump_o_x.sql

pg_dump -U postgres --create --clean sna > sna-postgres/pg_dump_create_clean.sql

# ERROR:  role "postgres" already exists
# ERROR:  database "sna" already exists
pg_dumpall > sna-postgres/data.sql

pg_dumpall -r > sna-postgres/roles.sql
pg_dumpall -c > sna-postgres/dumall-create.sql


#ERROR:  relation "public.NetworkProvider" does not exist
#sna-postgres | 2021-08-08 17:16:05.524 UTC [83] STATEMENT:  ALTER TABLE ONLY public."NetworkProvider" DROP CONSTRAINT "FK_NetworkProvider_Providers_ProviderId";
pg_dump -h localhost -U postgres -v -b -c sna > sna-postgres/data-clean.sql
	

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