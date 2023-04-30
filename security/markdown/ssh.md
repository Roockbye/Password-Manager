# SSH configuration

Put your ssh public key

```bash
$ vim /home/username/.ssh/authorized_keys
```

Create a new configuration file for sshd

```bash
$ sudo vim /etc/ssh/sshd_config.d/ssh_only.conf
```

- [ssh_only.conf](/security/ssh/etc/ssh/sshd_config.d/ssh_only.conf)

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
