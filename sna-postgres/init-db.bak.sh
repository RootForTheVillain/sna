#!/bin/sh
pg_restore \-p 5432 -U admin -d admin -v "/docker-entrypoint-initdb.d/data.dump"
exit