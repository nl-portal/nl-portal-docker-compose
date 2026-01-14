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
- connect to the container: `docker exec -it openzaak-database /bin/bash`. 
- connect to the database: `psql -U openzaak -d openzaak`. 

## Working with the database
Once inside `psql` you can execute sql statements
use `\q` to quit psql. 

## Tips & tricks
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'catalogi_zaaktype'
ORDER BY ordinal_position;