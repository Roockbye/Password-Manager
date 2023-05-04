# Certbot quick start

## Installation

```bash
$ sudo dnf install python3 augeas-libs

$ sudo python3 -m venv /opt/certbot/

$ sudo /opt/certbot/bin/pip install --upgrade pip

$ sudo /opt/certbot/bin/pip install certbot certbot-nginx

$ sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

## Generates certificates

```bash
$ sudo certbot certonly --standalone -d projet.engineer,dashboard.projet.engineer,passbolt.projet.engineer,working.projet.engineer,logs.projet.engineer
```

- Don't forget edit /etc/nginx/sites-enabled/*

```bash
$ sudo cat /etc/nginx/sites-enabled/logs.projet.engineer.conf | grep ssl_
    ssl_certificate /etc/letsencrypt/live/logs.projet.engineer/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/logs.projet.engineer/privkey.pem;
```
Replace by your own certificates locations

> [Official documentation](https://certbot.eff.org/)
