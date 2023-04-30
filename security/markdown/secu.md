# Securisation
## Separate services from the system

For services accessible from the net, the best practice is to separate them from the system (avoid FTP, Web, SQL on the same system)
It is possible to isolate the services of the main system with docker container.(see conf heimdall and passbolt)

## Time Synchronization (already installed)

```
$ sudo systemctl start chronyd && sudo systemctl enable chronyd

```

## Disable IPv6(if not used)

```
$ cat /etc/sysctl.d/70-ipv6.conf

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

$ ip a | grep inet6

```

## Swap (already up)

```
$ sudo fdisk -l | grep swap
Disk /dev/mapper/rl_localhost--live-swap: 7.79 GiB, 8367636480 bytes, 16343040 sectors

```


## Change the SSH port

Edit line #Port22

into Port 27497 (Helps avoid mass attacks if it is not on the default port)
## Minimize packets to minimize vulnerabilities 

to see what services are running on runlevel3 and whether they are needed or not

```
$ /sbin/chkconfig --list |grep '3:on'
```
if we want to remove the services
```
$ chkconfig serviceName off
```
if we want to delete the packets
```
$ yum -y remove package-name
```

## Disable Ctrl+Alt+Del key combination

This combination will restart the server

```
$ sudo vi /etc/systemd/logind.conf
```
find the line #HandleLidSwitch and add:
```
#HandleLidSwitch=ignore
HandlePowerKey=ignore
```
```
$ sudo systemctl restart systemd-logind.service
```

## Prevent users from using old passwords

- Limit using a password that was used in past.
Users can not set the same password within the generation.
```
$ sudo vi /etc/pam.d/system-auth
```
#line 21 : add [remember=*] (example below means 5 gen)
```
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5
```
The system will remember the last 5 password used so the user don't use it again


- Set minimum password length.
Users can not set thier password length less than this parameter
```
sudo vi /etc/security/pwquality.conf
```
#line 11 : uncomment and set minimum length (example below means 8 char)
minlen = 8


- Set minimum number of required classes of characters for the new password.
(kinds ⇒ UpperCase / LowerCase / Digits / Others)
```
sudo vi /etc/security/pwquality.conf
```
#line 34 : uncomment and set parameter (example below means 2 kinds)

minclass = 2

 - Set maximum number of allowed consecutive same characters in the new password.
 ```
sudo vi /etc/security/pwquality.conf
```
#line 38 : uncomment and set parameter (example below means 2 char)

maxrepeat = 2

- Set maximum number of allowed consecutive characters of the same class in the new password.
```
sudo vi /etc/security/pwquality.conf
```
#line 43 : uncomment and set parameter (example below means 4 kinds)

maxclassrepeat = 4

- Require at least one lowercase character in the new password.
```
sudo vi /etc/security/pwquality.conf
```
#line 25 : uncomment and set parameter (example below means 1 char)

lcredit = -1

- Require at least one uppercase character in the new password.
```
sudo vi /etc/security/pwquality.conf
```
#line 20 : uncomment and set parameter (example below means 1 char)

ucredit = -1

- Require at least one digit in the new password.
```
sudo vi /etc/security/pwquality.conf
```
#line 15 : uncomment and set parameter (example below means 1 char)

dcredit = -1

-  	Require at least one other character in the new password.
```
sudo vi /etc/security/pwquality.conf
```
#line 30 : uncomment and set parameter (example below means 1 char)

ocredit = -1

(NIST guidelines)
The United States Department of Commerce's National Institute of Standards and Technology (NIST) has put out two standards for password policies which have been widely followed.

## Audit Logs

Command to view audit events: 

``` 
sudo ausearch -m USER_LOGIN 
``` 

This command displays user login events. You can replace USER_LOGIN with other types of audit events (for example, USER_LOGOUT, USER_START, USER_END, and so on).

## Prohibit users from using cron

``` 
sudo vi /etc/cron.deny 
``` 

Add the names of the users you want to prohibit from using cron, one username per line Make sure that the /etc/cron.allow file does not exist or is empty. 

Note that if the /etc/cron.allow file exists, only the users listed in this file will be allowed to use cron. If you don't want to use this feature, you can simply delete or empty the file 

(Cron is a program for automatically executing scripts, commands, or software at a specific date and time, or according to a predefined cycle. Each user has a crontab file, allowing him to specify the actions to be performed)

## Monitor Linux Users Activity with psacct Tool
```
$ yum install psacct
```
```
$ sudo systemctl start psacct
```
```
$ sudo systemctl enable psacct
```
```
$ sudo systemctl status psacct
```
- ac command without specifying any argument will display total statistics of connect time in hours based on the user logins/logouts from the current wtmp file.
```
$ ac
        total       45.76
```
- Using the command “ac -d” will print out the total login time in hours by day-wise.
```
$ ac -d
Mar 23  total       12.88
Apr 15  total        0.97
Apr 19  total        0.05
Apr 20  total       18.29
Today   total       13.60
```
- Using the command “ac -p” will print the total login time of each Linux user in hours.
```
$ ac -p
        Logards                             10.62
        webserver                           27.30
        Roockbye                             7.90
        total       45.82
```
- To get the total login statistics time of user “tecmint” in hours, use the command as.
```
$ ac tecmint
        total        0.00
```
- The following command will print the day-wise total login time of user “tecmint” in hours.
```
$ ac -d tecmint
```
- The “sa” command is used to print the summary of commands that were executed by users.
```
$ sa
```
- To get the information of an individual user, use the options -u.
```
$ sa -u
```
- This command prints the total number of processes and CPU minutes. If you see a continued increase in these numbers, then it’s time to look into the system about what is happening.
```
$ sa -m
```
- The command “sa -c” displays the highest percentage of users.
```
$ sa -c
```
- The ‘latcomm‘ command is used to search and display previously executed user command information. You can also search commands of individual usernames. For example, we see commands of the user (tecmint).
```
$ lastcomm tecmint
```
- With the help of the lastcomm command, you will be able to view the individual use of each command.
```
$ lastcomm ls
```

## Keep /boot as read-only

Linux kernel and its related files are in /boot directory which is by default as read-write. Changing it to read-only reduces the risk of unauthorized modification of critical boot files. To do this, open “/etc/fstab” file.
```
$ vi /etc/fstab
```

Add the following line at the bottom, save and close it.
```
LABEL=/boot     /boot     ext2     defaults,ro     1 2
```
Please note that you need to reset the change to read-write if you need to upgrade the kernel in future.

## Secure the kernel from network attacks

Strengthening the TCP stack of the kernel prevents certain types of attacks such as limiting the configuration transmitted by the network for IPv4/IPv6, enabling execshield protection, enabling source IP address verification, preventing an IP spoofing attack... 

This is configured via sysctl etc ```/etc/sysctl.conf```


Reboot the machine soon after a kernel panic
```
kernel.panic=10
```
Addresses of mmap base, heap, stack and VDSO page are randomized
```
kernel.randomize_va_space=2
```
Ignore bad ICMP errors
```
net.ipv4.icmp_ignore_bogus_error_responses=1
```
Protects against creating or following links under certain conditions
```
fs.protected_hardlinks=1
fs.protected_symlinks=1
```
to ignore ping or broadcast request
