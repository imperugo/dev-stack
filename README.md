# dev-stack

I'm pretty bored to spent time configure my dev environments when I change my laptop or I need to configure another workstation.

Basically I use OSX as main operating system, so it is tested for MAC, but i'm trying to be careful enough to say it should go on other operating systems as well.

## Docker images

Usually I work with a stack composed by several external services:

- MongoDb
- Redis
- Elastic Search + Kibana + ElasticHQ + Cerebro
- Grafana + Loki for logging
- Grafana + Prometheus for monitoring

I created a set of Docker Compose that install and configure all the needed things to work locally.
The only thing to do is run this command

```bash
> ./install.sh
```

## Resource endpoints:## Resource endpoints:

| Service | Mapped Domain  | Direct Url  |
| ------------ | ------------ | ------------ |
| ElasticSearch  | http://elasticsearch.localhost/  | localhost: http://localhost:9200  |
| Kibana | http://kibana.localhost/  | http://localhost:5601  |
| ElasticHq  | http://elastichq.localhost/  | http://localhost:4000  |
| Grafana  |  http://grafana.localhost/ | http://localhost:3000  |
| Prometheus  |  http://prometheus.localhost/ | http://localhost:9090  |
| AlertManager  |  http://alertmanager.localhost/ | http://localhost:9093 |
| cAdvisor  |  http://cadvisor.localhost/ | http://localhost:8081  |
| Traefik Dashboard  |  http://localhost:8080/dashboard/ |  |

> **WARNING**, these configurations are for local development, they **SHOULD NOT BE USED IN PRODUCTION** as some security settings are disabled for convenience

In case you prefer to setup just some parts you have to create the netowrk before:

```bash
> docker network create devnet
```

then choise what you want to install

### MongoDB

This command install MongoDb and its exported needed for Prometheus

```bash
> docker compose -f ./mongo.yml -p mongo up -d
```

> It uses the default port 27017, no authentication required

### Redis

This command install Redis and its exported needed for Prometheus

```bash
> docker compose -f ./redis.yml -p redis up -d
```

> It uses the default port 6379, no authentication required

### Elastic Search and Kibana

This command install Elastic Search 8.3.3, Kibana 8.3.3 and the needed exporters for Prometheus.

```bash
> docker compose -f ./elastic-kibana.yml -p elastic-kibana up -d
```

### Grafana + Loki + Prometheys

This command install Grafana, Loki, Prometheus, Alert Manager and a bunch of exporters.

```bash
> docker compose -f ./grafana-loki-prometheus.yml -p grafana-loki-prometheus up -d
```

When everything is up and running, you docker desktop should look like this

<img width="1275" alt="Screenshot 2022-08-17 at 16 31 57" src="https://user-images.githubusercontent.com/758620/185161693-aa2beb04-25c0-491c-97ef-9f73049b5a90.png">

> Of course you  don't have to keep all the images running on you local machine, you can run what you need when you need.
