# sna-api

## A data volume (sna_pgdata) will automatically be created. Removing this volume will delete your data forever.

## Build your containers and run the project with Docker Compose:
```
$ cd /path/to/docker/compose/yml
$ docker-compose build
$ docker-compose up
```
## To reset your database...
Run these commands, then rebuild/run w/ Docker Compose
```
$ cd /path/to/reset-db.sh
$ sh reset-db.sh
```
### Get data/schema from database to automatically build in container
````
$ pg_dumpall > sna-postgres/init/data.sql
```
Then you'll need to remove the postgres user from data.sql by removing or commenting this lines:
```
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
```
