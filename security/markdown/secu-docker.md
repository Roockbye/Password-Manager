# Secure Docker

## Install Docker Bench Security

> We will use the tool provided by Docker to test the security of its Docker host: Docker Bench Security.

```bash
$ git clone https://github.com/docker/docker-bench-security.git 

$ sudo docker-bench-security/docker-bench-security.sh
```

It will give us in output all the elements that pass the security but also the elements in warning and those in between.
All that allow us to act on these element of security

## Secure Docker 

```bash
$ sudo vim /etc/docker/daemon.json 
```
```
{
        "userns-remap": "default",
        "userland-proxy": false,
        "iptables" : true,
        "no-new-privileges": true,
        "log-driver" : "syslog",
        "live-restore": true
}
```
> and test with the tool Docker Bench Security
