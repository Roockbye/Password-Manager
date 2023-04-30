# Fail2ban:

- Installation

```bash
$ sudo dnf install epel-release -y

$ sudo dnf install fail2ban fail2ban-firewalld -y

$ sudo dnf install fail2ban fail2ban-firewalld

$ sudo systemctl enable fail2ban --now
```


- Configuration

```bash
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
```bash
$ sudo vim /etc/fail2ban/jail.local
```
Under the [DEFAULT] section :

```
bantime = 24h
findtime = 5m
maxretry = 3
```

```bash
$ sudo systemctl restart fail2ban
```

See banned IPs:

```bash
$ sudo fail2ban-client status sshd

Status for the jail: sshd
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     0
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 1
   |- Total banned:     1
   `- Banned IP list:   77.196.149.138
```

Unban :

```bash
$ sudo fail2ban-client unban IP
```

Add some conditions for ports 80 and 443 :

- In jail.local:

```bash
$ sudo vim /etc/fail2ban/jail.local
```

Add those rules for ports 80(http) and 443(https)

```bash
[http-get-dos]
enabled = true
port = http,https
filter = http-get-dos
logpath = /var/log/httpd/access_log
maxretry = 10
findtime = 1s
bantime = 24h

[http-post-dos]
enabled = true
port = http,https
filter = http-post-dos
logpath = /var/log/httpd/access_log
maxretry = 10
findtime = 1s
bantime = 24h
```

And create the files:
```bash
$ sudo vi /etc/fail2ban/filter.d/http-get-dos.conf
```
Add those lines:
```bash
[Definition]
failregex = ^<HOST> -.*"(GET|POST).*HTTP.*"$
```
And
```bash
$ sudo vi /etc/fail2ban/filter.d/http-post-dos.conf
```
Add those lines:
```bash
[Definition]
failregex = ^<HOST> -.*"POST.*HTTP.*"$
```
And of course we have to restart the service
```bash
$ sudo systemctl restart fail2ban
```
And to see the logs of fail2ban:

```bash
$ sudo tail -f /var/log/fail2ban.log
```