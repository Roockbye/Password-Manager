# Netdata

## Installation

```bash
$ sudo dnf install netdata
```

## Limit acces

```bash
$ cat /etc/netdata/netdata.conf | grep connections
	 allow connections from = localhost
```

## Discord notifications

```bash
$ sudo dnf install netdata
$ sudo ./edit-config health_alarm_notify.conf
$ sudo vim /etc/netdata/health_alarm_notify.conf
```

Change in the file :

```bash
SEND_DISCORD="YES"
DISCORD_WEBHOOK_URL=<your webhook url>
DEFAULT_RECIPIENT_DISCORD=<your channel discord>
```

[Official documentation](https://learn.netdata.cloud/docs/getting-started/manage-and-configure/configuration)
