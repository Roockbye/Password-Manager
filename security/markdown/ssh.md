# SSH configuration


Put your ssh public key

```bash
$ vim /home/username/.ssh/authorized_keys
```

Create a new configuration file for sshd

```bash
$ sudo vim /etc/ssh/sshd_config.d/ssh_only.conf
```

```bash
PasswordAuthentication no
Port 27497
AuthorizedKeysFile     .ssh/authorized_keys
```

Open ssh port

```bash
$ sudo firewall-cmd --add-port=27497/tcp --permanent

$ sudo firewall-cmd --reload
```

... and enable sshd :

```bash
$ sudo systemctl enable sshd --now
```

- [Expensive documentation](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server-fr)