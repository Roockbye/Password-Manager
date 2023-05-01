## Prevent users from using old passwords

Here are some rules regarding passwords when a user determines theirs to be a strong password
It also takes into account not to use an old password because it represents a security breach

- For that we need to go to ```system-auth```

The implementation of a new authentication method should not require changes in the configuration or source code of a program or service. This is why applications rely on PAM, which provides them with the primitives necessary to authenticate their users.

auth = Authentication

This handles the authentication of the requester and establishes the rights of the account:

Usually authenticates with a password by comparing it to a value stored in a database, or by relying on an authentication server,

Establishes account settings: uid, gid, groups, and resource limits

So we go to ```pam.d/system-auth```

```bash
$ sudo cat /etc/pam.d/system-auth | grep [remember=*]
```

(means 5 gen)

The system will remember the last 5 password used so the user don't use it again


## Password parameters

### Configurations changes :

- Minimum password length.
- Minimum number of required classes of characters for the new password.
- Maximum number of allowed consecutive same characters in the new password.
- Maximum number of allowed consecutive characters of the same class in the new password.

- Require at least one lowercase character in the new password.
- Require at least one uppercase character in the new password.
- Require at least one digit in the new password.
- Require at least one other character in the new password.

```bash
$ sudo vim /etc/security/pwquality.conf
```
[pwquality.conf](/security/native_conf/etc/security/pwquality.conf)
