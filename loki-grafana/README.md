# Grafana-loki

> Log analizer and alerter.

## In progress

## Setup

```bash
$ sudo mkdir /opt/evaluate-loki

$ sudo vim /opt/evaluate-loki/docker-compose.yml
```
> [docker-compose.yml](/loki-grafana/opt/evaluate-loki/docker-compose.yml)

```bash
$ sudo find /opt/evaluate-loki/ -type d  -exec chmod 500 {} \;

$ sudo find /opt/evaluate-loki/ -type f  -exec chmod 600 {} \;
```

## Start Loki-grafana

```bash
$ cd /opt/evaluate-loki

$ docker compose up -d
```

## Config

> Config of loki
[.](/loki-grafana/opt/evaluate-loki/loki-config.yaml)
