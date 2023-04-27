# Server 

## Requierments

### Base

> Rocky install (check pics ?)

```
$ sudo dnf upgrade --refresh -y && sudo dnf install -y vim

$ sudo setenforce 0

$ sudo vim /etc/selinux/config

```

```
$ cat /etc/selinux/config | grep SELINUX=permissive
SELINUX=permissive

```

### Firewall configuration

```
$ sudo firewall-cmd --add-port=80/tcp --permanent
$ sudo firewall-cmd --add-port=443/tcp --permanent
$ sudo firewall-cmd --add-port=27497/tcp --permanent

$ sudo firewall-cmd --add-icmp-block=redirect --permanent

$ sudo firewall-cmd --add-rich-rule='rule family=ipv4 protocol value="icmp" limit value="10/s" accept' --permanent

$ sudo firewall-cmd --remove-service=cockpit --permanent
$ sudo firewall-cmd --remove-service=dhcpv6-client --permanent
$ sudo firewall-cmd --remove-service=mdns --permanent

$ sudo firewall-cmd --reload

```

```
$ sudo firewall-cmd --list-all

public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp1s0
  sources: 
  services: 
  ports: 443/tcp 80/tcp 27497/tcp
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: redirect
  rich rules: 
	rule family="ipv4" protocol value="icmp" accept limit value="10/s"

```

### SSH configuration

```
$ sudo cat /etc/ssh/sshd_config | grep sshd_config.d

#  /etc/ssh/sshd_config.d/  which will be automatically included below
Include /etc/ssh/sshd_config.d/*.conf

```

```
$ sudo cat /etc/ssh/sshd_config.d/ssh_only.conf
 
PasswordAuthentication no
Port 27497
AuthorizedKeysFile     .ssh/authorized_keys

```

```
$ sudo systemctl enable sshd --now

```

#### For each collaborator ; permissions are prohibitives

```
$ ls -al /home/<USERNAME>/ | grep .ssh
drwx------.  2 <USERNAME> <USERNAME>   29 Apr 20 11:02 .ssh

```

```
$ ls -al /home/<USERNAME>/.ssh | grep authorized_keys
-rw-------.  1 <USERNAME> <USERNAME>  740 Apr 20 11:02 authorized_keys

```

### Disable cups

```
$ sudo systemctl disable cups --now

```
