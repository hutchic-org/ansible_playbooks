[![unlicense licensed](https://img.shields.io/badge/license-unlicense-blue.svg)](./LICENSE)
[![Libraries.io for GitHub](https://img.shields.io/librariesio/github/hutchic/ansible_playbooks.png)](https://github.com/hutchic/ansible_playbooks/blob/master/requirements.txt)

# What

Ansible playbooks that control my various computers

# Bootstrapping Backup Server

- Setup the SSH key

```
export SERVER_IP=REDACTED
scp id_rsa.pub root@$SERVER_IP:~/id_rsa.pub
ssh root@$SERVER_IP
mkdir .ssh
cat id_rsa.pub >> .ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
```

- Add entry to inventory file
- Add host_vars file with `ansible_ssh_username` and `ansible_ssh_host`
- Use `ansible-encrypt` to encrypt the file
- Decrypt the private key `ansible-vault decrypt --output - id_rsa.rsa > id_rsa`
- `make new_server`
- Update the host_vars file with `ubuntu` as the new `ansible_ssh_username`
- `make provision_backup`

# Connecting to Crashplan

Copy the auth token
```
ssh -i id_rsa ubuntu@$SERVER_IP sudo cat /var/lib/crashplan/.ui_info | awk -F ',' '{print $2}'
```

Make a backup o fthe local .ui_info
```
cp /var/lib/crashplan/.ui_info ~/.ui_info
```

Edit the local .ui_info
```
/var/lib/crashplan/.ui_info
```
Change the port to 4200 and replace the existing authentication token with the
authentication token from the remote computer.

Setup the ssh port forwarding
```
ssh -i id_rsa -L 4200:localhost:4243 ubuntu@$SERVER_IP
```

Run the local Crashplan
