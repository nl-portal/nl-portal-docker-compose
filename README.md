# nl-portal-docker-compose
## Getting started
### Requirements
* Docker Compose

### Starting up
This repository offers two options for starting up the supporting services for NL Portal:
- Including all ZGW related services, like Open Zaak, Objects API and Objecttypes API
- Keycloak and database only

### Including all ZGW related services
Execute the following command: `docker compose --profile zgw up -d`
--profile zgw up -d
The following services will be started:
| Service   |      Mapped port      |
|----------|:-------------:|
| NL Portal database (postgres) |  5432         |
| Keycloak |  8082         |
| Keycloak database (postgres) |    -   |
| Open Zaak | 8001 |
| Open Zaak database (postgis) | - |
| Objecten API | 8010 |
| Objecten API database (postgis) | - |
| Objecttypen API | 8011 |
| Objecttypen API database (postgres) | - |
| Redis | - |

### Keycloak and database only
Execute the following command: `docker compose up -d`
| Service   |      Mapped port      |
|----------|:-------------:|
| NL Portal database (postgres) |  5432         |
| Keycloak |  8082         |
| Keycloak database (postgres) |    -   |
