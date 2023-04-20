
## Time Synchronization (already installed)

```
[webserver@projet ~]$ sudo systemctl start chronyd && sudo systemctl enable chronyd

```

## Disable IPv6

```
[webserver@projet ~]$ cat /etc/sysctl.d/70-ipv6.conf

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

[webserver@projet ~]$ ip a | grep inet6

```

## Swap (already up)

```
[webserver@projet ~]$ sudo fdisk -l | grep swap
Disk /dev/mapper/rl_localhost--live-swap: 7.79 GiB, 8367636480 bytes, 16343040 sectors

```
