# Security elements

## Backup

> Script to have a backup of the server

- [backup](/security/backup/backup.sh)

To know if the backup is up or no:

```bash
$ sudo bash /srv/backup.sh
tar: Removing leading `/' from member names
tar: Removing leading `/' from hard link targets
```
```
Now we need to make a service so the script can do a backup every day at midnight:

create your file:
```bash
sudo nano /etc/systemd/system/backup.service
```
And write this:
```bash
# Is a service for a backup
# 05/05/23

[Unit]
Description=Service for the backup
Wants=backupTimer.service

[Service]
Type=oneshot
ExecStart=/srv/backup.sh

[Install]
WantedBy=multi-user.target
```
Then create this file:
```bash
sudo nano /etc/systemd/system/backupTimer.service
```
And then write this in it:
```bash
[Unit]
Description=Timer for the backup
Requires=backup.service

[Timer]
Unit=backup.service
OnUnitActiveSec=24h

[Install]
WantedBy=multi-user.target
```
then:
```bash
sudo systemctl daemon-reload
```
And:
```bash
sudo systemctl enable backupTimer.service
```
This will activate the timer

## Disable Ctrl+Alt+Del key combination

> This combination can restart the server

```bash
$ sudo cat /etc/systemd/logind.conf | grep HandlePowerKey

#HandleLidSwitch=ignore
HandlePowerKey=ignore
```
```bash
$ sudo systemctl restart systemd-logind.service
```

## Disable IPv6(not used here)

```bash
$ sudo vim /etc/sysctl.d/70-ipv6.conf

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
```

## Fail2ban configuration

> Ban IP 

- [Fail2ban](/security/fail2ban/fail2ban.md)


## Keep /boot as read-only

> Linux kernel and its related files are in /boot directory which is by default as read-write. Changing it to read-only reduces the risk of unauthorized modification of critical boot files. To do this, open “/etc/fstab” file.

```bash
$ cat /etc/fstab | grep LABEL=/boot

LABEL=/boot     /boot     ext2     defaults,ro     1 2
```
- Please note that you need to reset the change to read-write if you need to upgrade the kernel in future.

## Psacct

> This is a monitoring linux users activity tool.

- [Psacct](/security/markdown/psacct.md)

## Prohibit users from using cron

> Cron is a program for automatically executing scripts, commands, or software at a specific date and time, or according to a predefined cycle. Each user has a crontab file, allowing him to specify the actions to be performed

```bash
$ sudo vim /etc/cron.allow 
```

Add the names of the users you want to authorize from using cron.


## Secure Docker

> Bench security and daemon.

- [Configuration](/security/markdown/secu-docker.md)


## Secure the kernel from network attacks

> Strengthening the TCP stack of the kernel prevents certain types of attacks such as limiting the configuration transmitted by the network for IPv4/IPv6, enabling execshield protection, enabling source IP address verification, preventing an IP spoofing attack...

- This is configured via [/etc/sysctl.conf](/security/native_conf/etc/sysctl.conf)

## Security checks

> Simple ckeck of things.

- [checks](/security/markdown/checks.md)

## Ssh configuration

> Distant connection to edit conf

- [ssh](/security/markdown/ssh.md)

## System-auth configuration

> Edit password gestion

- [password configuration](/security/markdown/passwd.md)
