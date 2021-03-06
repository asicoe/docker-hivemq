#!/bin/bash
docker service rm hivemq
docker build -t hivemq .
sleep 7
docker rm -f $(docker ps -aq)
docker service create --name hivemq -p 1883:1883 -e SWARM_NETWORK_BASE=192.168.110 --network hivemq --replicas=3 hivemq
watch -n 1 docker ps