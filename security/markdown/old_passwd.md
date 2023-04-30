## Prevent users from using old passwords

- Limit using a password that was used in past.
Users can not set the same password within the generation.

```bash
$ sudo vi /etc/pam.d/system-auth
```

#line 21 : add [remember=*] (example below means 5 gen)
```
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5
```bash
The system will remember the last 5 password used so the user don't use it again


- Set minimum password length.
Users can not set thier password length less than this parameter
```bash
sudo vi /etc/security/pwquality.conf
```
#line 11 : uncomment and set minimum length (example below means 8 char)
minlen = 8


- Set minimum number of required classes of characters for the new password.
(kinds ⇒ UpperCase / LowerCase / Digits / Others)
```bash
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
