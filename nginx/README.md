# NGINX

## Setup

```bash
$ sudo dnf install nginx -y

$ sudo systemctl enable nginx --now
```


## Save your conf or (default conf)

```bash
$ sudo tar -czvf /srv/nginx.old_$(date +'%F_%H-%M-%S').tar.gz /etc/nginx/ /usr/share/nginx/html/
```

## Simplified configuration 

```bash
$ sudo simplified_setup.sh
```

> [nginx_simplified_setup.sh](/nginx/nginx_simplified_setup.sh)

> We use [cerbot](/nginx/certbot.md)

```bash
$ sudo systemctl restart nginx
```

## Configuration
### /etc/nginx/

```bash
$ sudo vim /etc/nginx/nginx.conf
```

> [nginx.conf](/nginx/etc/nginx/nginx.conf)

### /etc/nginx/sites-enabled/

```bash
$ sudo vim /etc/nginx/sites-enabled/projet.engineer.conf
```

> [projet.engineer.conf](/nginx/etc/nginx/sites-enabled/projet.engineer.conf)



```bash
$ sudo vim /etc/nginx/sites-enabled/dashboard.projet.engineer.conf
```

> [dashboard.projet.engineer.conf](/nginx/etc/nginx/sites-enabled/dashboard.projet.engineer.conf)



```bash
$ sudo vim /etc/nginx/sites-enabled/passbolt.projet.engineer.conf
```

> [passbolt.projet.engineer.conf](/nginx/etc/nginx/sites-enabled/passbolt.projet.engineer.conf)



```bash
$ sudo vim /etc/nginx/sites-enabled/working.projet.engineer.conf
```

> [working.projet.engineer.conf](/nginx/etc/nginx/sites-enabled/working.projet.engineer.conf)

### /etc/nginx/conf.d/

```bash
$ sudo vim /etc/nginx/conf.d/errors.conf
```

> [errors.conf](/nginx/etc/nginx/conf.d/errors.conf)


```bash
$ sudo vim /etc/nginx/conf.d/proxy_pass.conf
```

> [proxy_pass.conf](/nginx/etc/nginx/conf.d/proxy_pass.conf)

## Templates

> These are my custom pages ; you can replace them by yours !

```bash
$ sudo vim /usr/share/nginx/html/index.html
```

> [index.html](/nginx/usr/share/nginx/html/index.html)



```bash
$ sudo vim /usr/share/nginx/html/404.html
```

> [404.html](/nginx/usr/share/nginx/html/404.html)



```bash
$ sudo vim /usr/share/nginx/html/50x.html
```

> [50x.html](/nginx/usr/share/nginx/html/50x.html)


## Certificates

> We use [cerbot](/nginx/certbot.md)

## Firewall configuration

```bash
$ sudo firewall-cmd --add-port=80/tcp --permanent
$ sudo firewall-cmd --add-port=443/tcp --permanent

$ sudo firewall-cmd --add-icmp-block=redirect --permanent

$ sudo firewall-cmd --add-rich-rule='rule family=ipv4 protocol value="icmp" limit value="10/s" accept' --permanent

$ sudo firewall-cmd --remove-service=cockpit --permanent
$ sudo firewall-cmd --remove-service=dhcpv6-client --permanent
$ sudo firewall-cmd --remove-service=mdns --permanent

$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all
```

## Restart nginx

```bash
$ sudo systemctl restart nginx
```

## Save your new configuration

```bash
$ sudo tar -czvf /srv/nginx_$(date +'%F_%H-%M-%S').tar.gz /etc/nginx/ /usr/share/nginx/html/
```

## Configuration generator

- You can also use NGINXConfig to help you :

> [NGINXConfig](https://www.digitalocean.com/community/tools/nginx?global.app.lang=fr)


## Access at server informations

> Authentification required to visite netdata page.

```bash
$ sudo sh -c "echo -n '[USERNAME]:' >> /etc/nginx/.htpasswd"
```

```bash
$ sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
```
