#!/bin/bash

export APP_SERVER_ADMIN_PASSWORD=jboss
export INSTALL_OWNER_PASSWORD=password
export ROOT_USER_PASSWORD=password
export REPOSITORY_PASSWORD=password
export EXTERNALDB_ADMIN_PASSWORD=password
export BOF_REGISTRY_USER_PASSWORD=password
export AEK_PASSPHRASE=password
export LOCKBOX_PASSPHRASE=Password@123

docker-compose up -d pgsql

docker exec -d --user postgres -it pgsql bash -c "mkdir -p /var/lib/postgresql/data/db_centdb_dat.dat"
docker exec -d --user postgres -it pgsql bash -c "mkdir -p /var/lib/postgresql/main/db_centdb_dat.dat"

docker-compose up -d centstateless

docker cp centstateless:/opt/dctm/config/dfc.properties rest/config/
docker-compose up -d rest