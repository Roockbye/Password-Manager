# Setup

```
$ docker compose -f docker-compose.yml exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
                                passbolt register_user \
                                -u [EMAIL] \
                                -f [NAME] \
                                -l [SURNAME] \
                                -r admin" -s /bin/sh www-data

```