# Base check

## Audit Logs

Command to view audit events: 

``` bash
$ sudo ausearch -m USER_LOGIN 
``` 

This command displays user login events. You can replace USER_LOGIN with other types of audit events (for example, USER_LOGOUT, USER_START, USER_END, and so on).

## Minimize packets to minimize vulnerabilities 

- To see what services are running on runlevel3 and whether they are needed or not :

```bash
$ /sbin/chkconfig --list |grep '3:on'
```

- If we want to remove the services :

```bash
$ chkconfig serviceName off
```
- If we want to delete the packets :

```bash
$ sudo dnf -y remove package-name
```

## Separate services from the system (Done here)

For services accessible from the net, the best practice is to separate them from the system (avoid FTP, Web, SQL on the same system)
It is possible to isolate the services of the main system with docker container.(see conf heimdall and passbolt)

## Swap (already up)

```bash
$ sudo fdisk -l | grep swap
Disk /dev/mapper/rl_localhost--live-swap: 7.79 GiB, 8367636480 bytes, 16343040 sectors
```

## Time Synchronization (already installed)

```bash
$ sudo systemctl start chronyd -now
```
