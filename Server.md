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

###


