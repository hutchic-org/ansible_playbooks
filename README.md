[![unlicense licensed](https://img.shields.io/badge/license-unlicense-blue.svg)](./LICENSE)
[![libraries.io](https://img.shields.io/librariesio/github/hutchic/ansible_playbooks.svg)

# What

Ansible playbooks that control my various computers

# Adding a new machine

- Setup the SSH key

```
export SERVER_IP=REDACTED
scp id_rsa.rsa.pub root@$SERVER_IP:~/id_rsa.rsa.pub
ssh root@$SERVER_IP
mkdir .ssh
cat id_rsa.rsa.pub >> .ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
```

- Add entry to inventory file
- Add host_vars file with `ansible_ssh_username` and `ansible_ssh_host`
- Use `ansible-encrypt` to encrypt the file
- Decrypt the private key `ansible-vault decrypt --output - id_rsa.rsa > id_rsa`
- `make new_server`
