# Password-Manager

There is our solution to kept your passwords secure !

## Requirements

You need rocky linux :
> [Rocky official image](https://rockylinux.org/download/)


### Base configuration

Update your rocky :

```bash
$ sudo dnf upgrade --refresh -y && sudo dnf install -y vim
```

Put SELinux to permissive now :

```bash
$ sudo setenforce 0
```
... and always :

```bash
$ sudo vim /etc/selinux/config
```

```bash
SELINUX=permissive
```

### SSH configuration

Create un new configuration file for sshd :

```bash
$ sudo vim /etc/ssh/sshd_config.d/ssh_only.conf
```

```bash
PasswordAuthentication no
Port 27497
AuthorizedKeysFile     .ssh/authorized_keys
```

... and enable sshd :

```bash
$ sudo systemctl enable sshd --now
```

> Collaborators MARMANDE Mélanie, RICCI Bastien, BARBOTEAU Mathieu

