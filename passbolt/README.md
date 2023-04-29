# Passbolt


## Setup

```bash
$ sudo mkdir /opt/passbolt

$ sudo vim /opt/passbolt/docker-compose.yml
```
> [docker-compose.yml](/heimdall/opt/passbolt/docker-compose.yml)

```bash
$ sudo find /opt/passbolt/ -type d  -exec chmod 500 {} \;

$ sudo find /opt/passbolt/ -type f  -exec chmod 600 {} \;
```

## Start passbolt

```bash
$ cd /opt/passbolt

$ docker compose up -d
```

## Set a new user

```bash
$ docker compose -f docker-compose.yml exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
                                passbolt register_user \
                                -u [EMAIL] \
                                -f [NAME] \
                                -l [SURNAME] \
                                -r admin" -s /bin/sh www-data
```