#!/bin/bash -ex

docker-compose build worker
docker-compose stop worker
echo y |  docker-compose rm worker
docker-compose create worker
docker-compose start worker

exit 0;
