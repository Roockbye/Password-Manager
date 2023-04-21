# Server 

## Requierments

### Base

> Rocky install (check pics ?)

```
[webserver@projet ~]$ sudo dnf upgrade --refresh -y && sudo dnf install -y vim

[webserver@projet ~]$ sudo setenforce 0

[webserver@projet ~]$ sudo vim /etc/selinux/config

```

```
[webserver@projet ~]$ cat /etc/selinux/config | grep SELINUX=permissive
SELINUX=permissive

```

### Firewall configuration

```
[webserver@projet ~]$ sudo firewall-cmd --remove-service=ssh
success

[webserver@projet ~]$ sudo firewall-cmd --add-port=27497/tcp
success

[webserver@projet ~]$ sudo firewall-cmd --list-all | grep 27497
  ports: 27497/tcp

[webserver@projet ~]$ sudo firewall-cmd --reload
success

```

### SSH configuration

```
[webserver@projet ~]$ sudo systemctl start sshd && sudo systemctl enable sshd

[webserver@projet ~]$ sudo cat /etc/ssh/sshd_config | grep sshd_config.d

#  /etc/ssh/sshd_config.d/  which will be automatically included below
Include /etc/ssh/sshd_config.d/*.conf


[webserver@projet ~]$ sudo cat /etc/ssh/sshd_config.d/ssh_only.conf
 
PasswordAuthentication no
Port 27497
AuthorizedKeysFile     .ssh/authorized_keys

[webserver@projet ~]$ sudo systemctl restart sshd

```

#### For each collaborator ; permissions are prohibitives

```
[webserver@projet ~]$ ls -al /home/webserver/ | grep .ssh
drwx------.  2 webserver webserver   29 Apr 20 11:02 .ssh

[webserver@projet ~]$ ls -al /home/webserver/.ssh | grep authorized_keys
-rw-------.  1 webserver webserver  740 Apr 20 11:02 authorized_keys

```

### Reliez PHP

⚠️⚠️⚠️ N'OUBLIEZ PAS de réinitialiser votre conf Apache avant de continuer. En particulier, remettez le port et le user par défaut.
🌞 Install de PHP

On ajoute le dépôt CRB
```
$ sudo dnf config-manager --set-enabled crb
```
On ajoute le dépôt REMI
```
$ sudo dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-9.rpm -y
```

On liste les versions de PHP dispos, au passage on va pouvoir accepter les clés du dépôt REMI
```
$ dnf module list php
```

On active le dépôt REMI pour récupérer une version spécifique de PHP, celle recommandée par la doc de NextCloud
```
$ sudo dnf module enable php:remi-8.1 -y
```

## Eeeet enfin, on installe la bonne version de PHP : 8.1
```
$ sudo dnf install -y php81-php
```
🌞 Install de tous les modules PHP nécessaires pour NextCloud

eeeeet euuuh boom. Là non plus j'ai pas pondu ça, c'est la doc :
```
$ sudo dnf install -y libxml2 openssl php81-php php81-php-ctype php81-php-curl php81-php-gd php81-php-iconv php81-php-json php81-php-libxml php81-php-mbstring php81-php-openssl php81-php-posix php81-php-session php81-php-xml php81-php-zip php81-php-zlib php81-php-pdo php81-php-mysqlnd php81-php-intl php81-php-bcmath php81-php-gmp
```
🌞 Récupérer NextCloud
