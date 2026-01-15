# Database help

<!-- TOC -->
* [Openzaak database help](#database-help)
    * [Getting started](#getting-started)
        * [Requirements](#requirements)
        * [Connecting to the PostgreSQL container](#connecting-to-the-postgresql-container)
    * [Working with the database](#working-with-the-database)
    * [Tips & tricks](#tips--tricks)
<!-- TOC -->

## Getting started
Make sure you have dockerdesktop running

### Requirements
- The docker container 'openzaak-database' is running

### Connecting to the PostgreSQL container
- connect to the container: `docker exec -it openproducten-database /bin/bash`. 
- connect to the database: `psql -U openproduct -d openproduct`.
-- (env | grep POSTGRES  will give you the current user if needed)

## Working with the database
Once inside `psql` you can execute sql statements
use `\q` to quit psql. 

## Get the table layout etc
\dt                                 -> get all the tables from the database
\d public.zgw_consumers_service     -> to get all the table information