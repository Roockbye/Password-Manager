# Fail2ban:

 ## Installation

```bash
$ sudo dnf install epel-release -y

$ sudo dnf install fail2ban fail2ban-firewalld -y

$ sudo dnf install fail2ban fail2ban-firewalld

$ sudo systemctl enable fail2ban --now
```

## Configuration

```bash
$ sudo vim /etc/fail2ban/jail.local
```

- [jail.local](/security/fail2ban/etc/fail2ban/jail.local)

```bash
$ sudo vi /etc/fail2ban/filter.d/http-get-dos.conf
```

- [http-get-dos.conf](/security/fail2ban/etc/fail2ban/filter.d/http-get-dos.conf)

```bash
$ sudo vi /etc/fail2ban/filter.d/http-post-dos.conf
```

- [http-post-dos.conf](/security/fail2ban/etc/fail2ban/filter.d/http-post-dos.conf)

```bash
$ sudo systemctl restart fail2ban
```

## Usage

- See banned IPs

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

- Unban

```bash
$ sudo fail2ban-client unban IP
```

- Check logs

```bash
$ sudo tail -f /var/log/fail2ban.log
```
