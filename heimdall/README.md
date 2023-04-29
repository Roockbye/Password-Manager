# Heimdall


## Setup

```bash
$ sudo mkdir /opt/heimdall

$ sudo vim /opt/heimdall/docker-compose.yml
```
> [docker-compose.yml](/heimdall/opt/heimdall/docker-compose.yml)

```bash
$ sudo find /opt/heimdall/ -type d  -exec chmod 500 {} \;

$ sudo find /opt/heimdall/ -type f  -exec chmod 600 {} \;
```

## Start heimdall

```bash
$ cd /opt/heimdall

$ docker compose up -d
```