# NGINX

## Simplified setup 

```bash
$ sudo simplified_setup.sh
```

> [simplified_setup.sh](/nginx/simplified_setup.sh)

> We use [cerbot](/nginx/certbot.md)

```bash
$ sudo systemctl restart nginx
```

## Setup

```bash
$ sudo dnf install nginx -y

$ sudo systemctl enable nginx --now
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

> There are my custom pages ; you can replace them by yours !

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

## Restart nginx

```bash
$ sudo systemctl restart nginx
```