#!/bin/bash

docker network rm devnet
docker network create devnet
docker compose -f ./mongo.yml -p mongo up -d --remove-orphans --force-recreate --build -d
docker compose -f ./redis.yml -p redis up -d --remove-orphans --force-recreate --build -d
docker compose -f ./elastic-kibana.yml -p elastic-kibana up -d --remove-orphans --force-recreate --build -d
docker compose -f ./grafana-loki-prometheus.yml -p grafana-loki-prometheus up -d --remove-orphans --force-recreate --build -d
docker compose -f ./ingress.yml -p ingress up -d --remove-orphans --force-recreate --build -d