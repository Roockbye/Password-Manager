# Password-Manager

> Collaborators MARMANDE Mélanie, RICCI Bastien, BARBOTEAU Mathieu
There is our solution to kept your passwords secure !

## Requirements

You need rocky linux :
> [Rocky official image](https://rockylinux.org/download/)

- Public IP
- Domain name (everything is set for projet.engineer)


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


