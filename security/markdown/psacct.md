# Monitor linux users activity with psacct Tool

```bash
$ sudo dnf install psacct -y
```

```bash
$ sudo systemctl enable psacct --now
```

- ac command without specifying any argument will display total statistics of connect time in hours based on the user logins/logouts from the current wtmp file.

```bash
$ ac
```

- The “sa” command is used to print the summary of commands that were executed by users.

```bash
$ sa
```

- The ‘latcomm‘ command is used to search and display previously executed user command information. You can also search commands of individual usernames. For example, we see commands of the user (user).

```bash
$ lastcomm user
```

- With the help of the lastcomm command, you will be able to view the individual use of each command.

```bash
$ lastcomm ls
```