#!/bin/bash

docker network rm devnet
docker network create devnet
docker compose -f ./mongo.yml -p mongo up -d
docker compose -f ./redis.yml -p redis up -d
docker compose -f ./elastic-kibana.yml -p elastic-kibana up -d
docker compose -f ./grafana-loki-prometheus.yml -p grafana-loki-prometheus up -d