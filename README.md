# Password-Manager

This our solution to keep your passwords safe !

> Collaborators MARMANDE Mélanie, RICCI Bastien, BARBOTEAU Mathieu

## Requirements

You need rocky linux :
> [Rocky official image](https://rockylinux.org/download/)

- Public IP
- Domain name (everything is set for projet.engineer)
- Your domain name must point to your IP


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

## Installation

### Step 1 : Nginx

> [Nginx](/nginx/)

### Step 2 : Heimdall

> [Heimdall](/heimdall/)

### Step 3 : Passbolt

> [Passbolt](/passbolt/)

### Step 4 : Netdata

> [Netdata](/netdata/)

### Step 4 : Grafana

> [Grafana](/grafana/)

### Step 5 : Security checks

> [Security](/security/)