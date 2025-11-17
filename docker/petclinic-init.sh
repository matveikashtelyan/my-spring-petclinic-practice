#!/bin/bash

MYSQL_USER='vetuser'
MYSQL_PASSWORD='vetuserpwd'
MYSQL_DATABASE='petclinic'
MYSQL_ROOT_PASSWORD='root'

docker run \
    --name petclinic-app \
    --network petclinic-net \
    --env MYSQL_URL="jdbc:mysql://petclinic-mysql:3306/$MYSQL_DATABASE"\
    --env MYSQL_USER="$MYSQL_USER" \
    --env MYSQL_PASS="$MYSQL_PASSWORD" \
    --env SPRING_PROFILES_ACTIVE="mysql" \
    --detach petclinic:latest