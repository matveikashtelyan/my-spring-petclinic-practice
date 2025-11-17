#!/bin/bash

MYSQL_USER='vetuser'
MYSQL_PASSWORD='vetuserpwd'
MYSQL_DATABASE='petclinic'
MYSQL_ROOT_PASSWORD='root'

docker run \
    --name petclinic-mysql \
    --network petclinic-net \
    --mount type=volume,src=petclinic-mysql-vol,dst=/var/lib/mysql \
    --env MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD" \
    --env MYSQL_USER="$MYSQL_USER" \
    --env MYSQL_PASSWORD="$MYSQL_PASSWORD" \
    --env MYSQL_DATABASE="$MYSQL_DATABASE" \
    --detach mysql:8.0.44-debian