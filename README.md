# Important

Check the new and still maintained version of this repo: https://github.com/ServerContainers/phppgadmin

# phppgadmin - (marvambass/phppgadmin) (+ optional tls) on debian, apache2 [x86 + arm]

_maintained by MarvAmBass_

## What is it

This Dockerfile (available as ___marvambass/phppgadmin___) gives you a ready to use phppgadmin installation with optional tls.

Note: This container only supports `postgres` database servers.
There is no internal postgres-server available - so you need to setup a seconds container for that (take a look at `docker-compose.yml`)

Note: `extra_login_security` is `false` per default. Make sure you understand what that means in production environments etc.

View in Docker Registry [marvambass/phppgadmin](https://hub.docker.com/r/marvambass/phppgadmin)

View in GitHub [MarvAmBass/docker-phppgadmin](https://github.com/MarvAmBass/docker-phppgadmin)

This Dockerfile is based on the [marvambass/apache2-ssl-secure](https://registry.hub.docker.com/u/marvambass/apache2-ssl-secure/) `debian:10` based image.

## Changelogs

* 2021-08-28
    * inital commit
    * multiarch build

## How to use

This container needs to connect to a database, so take a look at the `docker-compose.yml`

## Environment variables and defaults

* __DB\_HOST__
 * host of postgres db
 * default: `db`

* __DB\_PORT__
 * port of postgres db
 * default: `5432`

* __DEFAULT\_DB__
 * set default db
 * default: `template1`

* __EXTRA\_LOGIN\_SECURITY__
 * since I want this container to be a usable in every situation it's `false` per default
 * if you want to use this container for a production/long-running environment, you might want to change this
 * default: `false`

### BASEIMAGE: Environment variables and defaults

* __DISABLE\_TLS__
 * default: not set - if set yo any value `https` and the `HSTS_HEADERS_*` will be disabled

* __HSTS\_HEADERS\_ENABLE__
 * default: not set - if set to any value the HTTP Strict Transport Security will be activated on SSL Channel

* __HSTS\_HEADERS\_ENABLE\_NO\_SUBDOMAINS__
 * default: not set - if set together with __HSTS\_HEADERS\_ENABLE__ and set to any value the HTTP Strict Transport Security will be deactivated on subdomains

