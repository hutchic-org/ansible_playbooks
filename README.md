# Prerequisites

Ansible needs to be able to SSH into the instance and it must have python installed
to configure it. So on a fresh instance use the following process to setup ssh keys

```
export SERVER_IP=REDACTED
scp backupsy.rsa.pub root@$SERVER_IP:~/backupsy.rsa.pub
ssh root@$SERVER_IP
mkdir .ssh
cat backupsy.rsa.pub >> .ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
```
