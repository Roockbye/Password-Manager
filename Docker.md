$ docker compose up -d

$ docker compose up -d

$ docker ps

$ docker volume ls -q

$ docker volume rm $(docker volume ls -q)

$ docker compose down

$ docker compose -f docker-compose_passbolt.yml exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
                                passbolt register_user \
                                -u [EMAIL] \
                                -f [NAME] \
                                -l [SURNAME] \
                                -r admin" -s /bin/sh www-data

$