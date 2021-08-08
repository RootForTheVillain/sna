# sna-api

## Build your containers and run the project with Docker Compose:
```
$ cd /path/to/docker/compose/yml
$ docker-compose build
$ docker-compose up
```
Data is stored in a volume named sna_pgdata. 

## To reset your database, regenerate the pg dump, then comment out the postgres user (this will cause database create to fail)
````
$ pg_dumpall > sna-postgres/init/data.sql

## Then you'll need to remove the postgres user from data.sql by removing or commenting this lines or it will fail to build the database:

--CREATE ROLE postgres;
--ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
