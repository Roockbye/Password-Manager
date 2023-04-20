
## Time Synchronization

```
[webserver@projet ~]$ sudo systemctl start chronyd && sudo systemctl enable chronyd

```

## Disable IPv6

```
[webserver@projet ~]$ cat /etc/sysctl.d/70-ipv6.conf

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

[webserver@projet ~]$ ip a | grep inet6

```

## Swap (already up)

```
[webserver@projet ~]$ sudo fdisk -l | grep swap
Disk /dev/mapper/rl_localhost--live-swap: 7.79 GiB, 8367636480 bytes, 16343040 sectors

```

## Fail2ban:

vérification du firewall en premier:

```
$ sudo systemctl start firewalld
```
```
$ sudo systemctl enable firewalld
```
```
$ sudo systemctl status firewalld
```

install de epel pour le fail2ban

```
$ sudo dnf install epel-release
```

install de fail2ban

```
$ sudo dnf install fail2ban fail2ban-firewalld
```
```
$ sudo systemctl start fail2ban
```
```
$ sudo systemctl enable fail2ban
```
```
$ sudo systemctl status fail2ban
```

configurer fail2ban

```
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
```
$ sudo vim /etc/fail2ban/jail.local
```
Sous la section [DEFAULT] 

```
bantime = 24h
findtime = 5m
maxretry = 3
```

```
$ sudo systemctl restart fail2ban
```

pour voir le nombre d'ips ban:

```
[Roockbye@projet ~]$ sudo fail2ban-client status sshd
[sudo] password for Roockbye:
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

