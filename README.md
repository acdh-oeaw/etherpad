# Etherpad - Docker image

A Docker image for https://github.com/ether/etherpad-lite.git

## Deployment on ACDH-CH servers

Deployment on ACDH-CH k8s cluster is performed over Github actions.

### Environment variables

| Environment Variable | Required | Default      | Description                                                            |
|----------------------|----------|--------------|------------------------------------------------------------------------|
| ADMIN_PASSWORD       |    +     |              | Admin password                                                         |
| DB_CHARSET           |    +     |    UTF8      | Database encoding                                                      |
| DB_HOST              |    +     |              | Database host                                                          |
| DB_NAME              |    +     |              | Database name                                                          |
| DB_PASS              |    +     |              | Database password                                                      |
| DB_PORT              |    +     |    5432      | Database port                                                          |
| DB_TYPE              |    +     |   postgres   | Database type                                                          |
| DB_USER              |    +     |   postgres   | Database user                                                          |
| LOGLEVEL             |    +     |    debug     | Log level                                                              |
| NODE_ENV             |    +     |  production  | Node ENV                                                               |
| SKIN_NAME            |    +     |   colibris   | Skin name                                                              |
| TRUST_PROXY          |    +     |  TRUST_PROXY | Trust proxy                                                            |
| USER_PASSWORD        |    +     |              | User password                                                          |
