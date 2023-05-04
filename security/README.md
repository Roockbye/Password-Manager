# Security elements

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

## Backup

> Script to have a backup of the server

- [backup](/security/backup/backup.sh)

After writing the script of the backup, open crontab to schedule the automatic backup

```bash
crontab -e
```
What is crontab:

Crontab is a system command on Linux and Unix that allows users and administrators to schedule automatic tasks to run at specific times, regular or not. Crontab is an abbreviation of "cron table" and refers to the configuration file that contains the list of scheduled tasks to be executed. Tasks can be shell scripts, system commands, or applications. Crontab is used to automate repetitive tasks such as backups, updates, reports, etc.

- Then we write this line so we have a backup every day at midnight

```bash
0 0 * * * /srv/backup.sh
```

How to make a backup manually:
```bash
[Roockbye@projet ~]$ bash /srv/backup.sh 
```

And how to view all the backups:
```bash
[Roockbye@projet ~]$ ls -l /path/to/backup/folder
total 16
-rw-r--r--. 1 Roockbye Roockbye 123 May  4 16:45 backup-2023-05-04-16-45-23.tar.gz
-rw-r--r--. 1 Roockbye Roockbye 134 May  4 16:50 backup-2023-05-04-16-50-56.tar.gz
-rw-r--r--. 1 Roockbye Roockbye 134 May  4 16:57 backup-2023-05-04-16-57-08.tar.gz
-rw-r--r--. 1 root     root     134 May  4 16:59 backup-2023-05-04-16-59-01.tar.gz
```
Be also aware to give the right like:
```bash
[Roockbye@projet ~]$ sudo chown -R Roockbye:Roockbye /path/to/backup/folder
```