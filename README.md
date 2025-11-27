# nl-portal-docker-compose

<!-- TOC -->
* [nl-portal-docker-compose](#nl-portal-docker-compose)
  * [Getting started](#getting-started)
    * [Requirements](#requirements)
    * [Starting up](#starting-up)
      * [Including all ZGW related services](#including-all-zgw-related-services)
      * [Keycloak and database only](#keycloak-and-database-only)
  * [Maintenance](#maintenance)
    * [Updating Openzaak data](#updating-openzaak-data)
  * [Known issues](#known-issues)
<!-- TOC -->

## Getting started
### Requirements
- [Docker Desktop](https://docs.docker.com/desktop/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Starting up
This repository offers two options for starting up the supporting services for NL Portal:
- Including all ZGW related services, like Open Zaak, Open Klant, Objects API and Objecttypes API
- Keycloak and database only

#### Including all ZGW related services
Execute the following command:
```shell
docker compose --profile zgw up -d
```

The following services will be started:
| Service   |      Mapped port      |
|----------|:-------------:|
| NL Portal database (postgres) |  54321         |
| Keycloak |  8082         |
| Keycloak database (postgres) |    -   |
| Open Zaak | 8001 |
| Open Zaak database (postgis) | - |
| Open Klant | 8006 |
| Open Klant database (postgis) | - |
| Objecten API | 8010 |
| Objecten API database (postgis) | - |
| Objecttypen API | 8011 |
| Objecttypen API database (postgres) | - |
| Open Klant 2 | 8007 |
| Open Klant database (postgres) | - |
| Open Product | 8070 |
| Open Product database (postgres) | - |
| Redis | - |

#### Keycloak and database only
Execute the following command: 
```shell
docker compose up -d
```
| Service   |      Mapped port      |
|----------|:-------------:|
| NL Portal database (postgres) |  54321         |
| Keycloak |  8082         |
| Keycloak database (postgres) |    -   |

## Maintenance

### Updating Openzaak data

There is a script `./imports/open-zaak/resync/resync.sh` that will automatically create an import script for several tables of 
OpenZaak. It requires that you install the postgres CLI tool `pg_dump` found in the postgres CLI tools. 

You should only run this script if you have recently upgraded OpenZaak or added new data in OpenZaak you want to make available 
after clearing the database.

## Known issues

* Running on Windows  
If the services within this compose file fail to start up with the following error or similar:  
    ```log
    2025-11-18 11:15:41.901 | /app/init/init.sh: 2: 
    2025-11-18 11:15:41.902 | Apply database migrations
    2025-11-18 11:15:59.325 | Unknown command: 'migrate\r'. Did you mean migrate?
    2025-11-18 11:15:59.325 | Type 'manage.py help' for usage.
    2025-11-18 11:16:04.229 | Traceback (most recent call last):
    2025-11-18 11:16:04.229 |   File "/usr/local/lib/python3.12/site-packages/django/db/backends/base/base.py", line 279, in ensure_connection
    2025-11-18 11:16:04.235 |     self.connect()
    2025-11-18 11:16:04.235 |   File "/usr/local/lib/python3.12/site-packages/django/utils/asyncio.py", line 26, in inner
    2025-11-18 11:16:04.237 |     return func(*args, **kwargs)
    2025-11-18 11:16:04.237 |            ^^^^^^^^^^^^^^^^^^^^^
    2025-11-18 11:16:04.237 |   File "/usr/local/lib/python3.12/site-packages/django/db/backends/base/base.py", line 256, in connect
    2025-11-18 11:16:04.237 |     self.connection = self.get_new_connection(conn_params)
    2025-11-18 11:16:04.237 |                       
    ```
  Then that means either your editor or git is replacing linux line endings with windows compatible crlf line endings.
  To work with this repository you need to make sure that doesn't happen:
  * Git: https://docs.github.com/en/get-started/git-basics/configuring-git-to-handle-line-endings?platform=windows#about-line-endings  
    * Make sure that the `core.autocrlf` property in git is set to `false` and then pull the project again.