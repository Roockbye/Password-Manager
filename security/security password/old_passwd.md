## Prevent users from using old passwords

Here are some rules regarding passwords when a user determines theirs to be a strong password

It also takes into account not to use an old password because it represents a security breach

-For that we need to go to ```system-auth```

The implementation of a new authentication method should not require changes in the configuration or source code of a program or service. This is why applications rely on PAM, which provides them with the primitives* necessary to authenticate their users.

auth - Authentication

This handles the authentication of the requester and establishes the rights of the account:

Usually authenticates with a password by comparing it to a value stored in a database, or by relying on an authentication server,

Establishes account settings: uid, gid, groups, and resource limits

So we go to ```pam.d/system-auth```

```bash
$ sudo vi /etc/pam.d/system-auth
```

```#line 21 : add [remember=*]``` 
```bash
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5  
```  
(means 5 gen)

The system will remember the last 5 password used so the user don't use it again


- Set minimum password length.
Users can not set their password length less than this parameter

for that we need to go to another file [security/pwquality.conf](./pwquality.conf) :
```bash
sudo vi /etc/security/pwquality.conf
```
This file contains all the rule concerning the password, so the user is forced to choose a strong password

```#line 11 ```: uncomment and set minimum length

```minlen = 8``` (means 8 char)
```bash
# Minimum acceptable size for the new password (plus one if
# credits are not disabled which is the default). (See pam_cracklib manual.)
# Cannot be set to lower value than 6.
 minlen = 8
```

- Set minimum number of required classes of characters for the new password.
(kinds ⇒ UpperCase / LowerCase / Digits / Others)
Still to the same file:
```bash
sudo vi /etc/security/pwquality.conf
```
```#line 34 ```: uncomment and set parameter 

```minclass = 2``` (means 2 kinds)
```bash
# The minimum number of required classes of characters for the new
# password (digits, uppercase, lowercase, others).
 minclass = 2
```
 - Set maximum number of allowed consecutive same characters in the new password.

 Still the same file:

 ```
sudo vi /etc/security/pwquality.conf
```
```#line 38 ```: uncomment and set parameter 

```maxrepeat = 2``` (means 2 char)
```bash
# The maximum number of allowed consecutive same characters in the new password.
# The check is disabled if the value is 0.
 maxrepeat = 2
```

- Set maximum number of allowed consecutive characters of the same class in the new password.

Still the same file:
```
sudo vi /etc/security/pwquality.conf
```
```#line 43 ```: uncomment and set parameter 

```maxclassrepeat = 4``` (means 4 kinds)

```bash
# The maximum number of allowed consecutive characters of the same class in the
# new password.
# The check is disabled if the value is 0.
 maxclassrepeat = 4
```

- Require at least one lowercase character in the new password.

Still the same file:
```
sudo vi /etc/security/pwquality.conf
```
```#line 25 ```: uncomment and set parameter

```lcredit = -1 ```(means 1 char)

```bash
# The maximum credit for having lowercase characters in the new password.
# If less than 0 it is the minimum number of lowercase characters in the new
# password.
 lcredit = -1
```

- Require at least one uppercase character in the new password.

You know by now that it all on this same file:
```
sudo vi /etc/security/pwquality.conf
```
```#line 20 ```: uncomment and set parameter 

```ucredit = -1``` (means 1 char)

```bash
# The maximum credit for having uppercase characters in the new password.
# If less than 0 it is the minimum number of uppercase characters in the new
# password.
 ucredit = -1
```

- Require at least one digit in the new password.

```#line 15 ```: uncomment and set parameter 

```dcredit = -1``` (means 1 char)
```bash
# The maximum credit for having digits in the new password. If less than 0
# it is the minimum number of digits in the new password.
 dcredit = -1
```
-  	Require at least one other character in the new password.

```#line 30``` : uncomment and set parameter 

```ocredit = -1``` (means 1 char)

```bash
# The maximum credit for having other characters in the new password.
# If less than 0 it is the minimum number of other characters in the new
# password.
 ocredit = -1
```
There are other rules regarding passwords in this conf file, just remove the comments. In our case we will stay with these rules there only

Where those rules come from:

(NIST guidelines)

The United States Department of Commerce's National Institute of Standards and Technology (NIST) has put out two standards for password policies which have been widely followed.
