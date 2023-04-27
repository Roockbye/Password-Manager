
## Time Synchronization (already installed)

```
$ sudo systemctl start chronyd && sudo systemctl enable chronyd

```

## Disable IPv6(si non utilisé)

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

## Fail2ban:

vérification du firewall en premier:

```
$ sudo systemctl enable firewalld --now
```
```
$ sudo systemctl status firewalld
```

install de epel pour le fail2ban

```
$ sudo dnf install epel-release
```

install de fail2ban

```
$ sudo dnf install fail2ban fail2ban-firewalld
```
```
$ sudo systemctl enable fail2ban --now
```
```
$ sudo systemctl status fail2ban
```

configurer fail2ban

```
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
```
$ sudo vim /etc/fail2ban/jail.local
```
Sous la section [DEFAULT]

```
bantime = 24h
findtime = 5m
maxretry = 3
```

```
$ sudo systemctl restart fail2ban
```

pour voir le nombre d'ips ban:

```
$ sudo fail2ban-client status sshd

Status for the jail: sshd
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     0
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 1
   |- Total banned:     1
   `- Banned IP list:   77.196.149.138
```

Pour enlever une IP ban

```
$ sudo fail2ban-client unban IP
```

## Changer le port SSH

Modifier la ligne #Port22

en Port 27497 (Il faut mettre un port à partir de 1024)
(permet d'éviter les attques de masse si il ne se trouve pas sur le port par défaut )

## Minimiser les packets pour minimiser les vulnérabilités

pour voir les services qui tournent sur runlevel3 et si ils sont nécessaires ou non

```
$ /sbin/chkconfig --list |grep '3:on'
```
si on veut enlever les services
```
$ chkconfig serviceName off
```
si on veut supprimer les packets
```
$ yum -y remove package-name
```


## Désactiver la combinaison de touches Ctrl+Alt+Suppr

Cette combinaison va faire redémarrer le serveur

```
$ sudo vi /etc/systemd/logind.conf
```
trouver la ligne #HandleLidSwitch et ajouter:
```
#HandleLidSwitch=ignore
HandlePowerKey=ignore
```
```
$ sudo systemctl restart systemd-logind.service
```

## Empêcher aux utilisateurs d'utiliser d'anciens mots de passe

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

## Journaux d'Audit

Commande pour visualiser les événements d'audit:

```
sudo ausearch -m USER_LOGIN
```
Cette commande affiche les événements de connexion des utilisateurs. Vous pouvez remplacer USER_LOGIN par d'autres types d'événements d'audit (par exemple, USER_LOGOUT, USER_START, USER_END, etc.)

## Interdire aux utilisateurs d'utiliser cron

```
sudo vi /etc/cron.deny
```

Ajoutez les noms des utilisateurs que vous souhaitez interdire d'utiliser cron, un nom d'utilisateur par ligne

Assurez-vous que le fichier /etc/cron.allow n'existe pas ou qu'il est vide.

Notez que si le fichier /etc/cron.allow existe, seuls les utilisateurs répertoriés dans ce fichier seront autorisés à utiliser cron. Si vous ne souhaitez pas utiliser cette fonctionnalité, vous pouvez simplement supprimer ou vider le fichier

(Cron est un programme pour exécuter automatiquement des scripts, des commandes ou des logiciels à une date et une heure spécifiée précise, ou selon un cycle défini à l'avance. Chaque utilisateur a un fichier crontab, lui permettant d'indiquer les actions à exécuter)

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