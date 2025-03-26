# nl-portal-docker-compose
## Getting started
### Requirements
- [Docker Desktop](https://docs.docker.com/desktop/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Starting up
This repository offers two options for starting up the supporting services for NL Portal:
- Including all ZGW related services, like Open Zaak, Open Klant, Objects API and Objecttypes API
- Keycloak and database only

### Including all ZGW related services
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
| Redis | - |

### Keycloak and database only
Execute the following command: 
```shell
docker compose up -d
```
| Service   |      Mapped port      |
|----------|:-------------:|
| NL Portal database (postgres) |  54321         |
| Keycloak |  8082         |
| Keycloak database (postgres) |    -   |

### Updating Openzaak data

There is a script `./imports/open-zaak/resync/resync.sh` that will automatically create an import script for several tables of 
OpenZaak. It requires that you install the postgres CLI tool `pg_dump` found in the postgres CLI tools. 

You should only run this script if you have recently upgraded OpenZaak or added new data in OpenZaak you want to make available 
after clearing the database.

### Updating Openzaak data

There is a script `./imports/open-zaak/resync/resync.sh` that will automatically create an import script for several tables of 
OpenZaak. It requires that you install the postgres CLI tool `pg_dump` found in the postgres CLI tools. 

You should only run this script if you have recently upgraded OpenZaak or added new data in OpenZaak you want to make available 
after clearing the database.
