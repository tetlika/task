#!/bin/bash -ex

docker-compose build --no-cache
docker-compose up --scale worker=$1

exit 0;
