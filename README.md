[![unlicense licensed](https://img.shields.io/badge/license-unlicense-blue.svg)](./LICENSE)
[![Libraries.io for GitHub](https://img.shields.io/librariesio/github/hutchic/ansible_playbooks.png)](https://github.com/hutchic/ansible_playbooks/blob/master/requirements.txt)

# What

Ansible playbooks that control my various computers

# Bootstrapping Personal Development Desktop

```
sudo apt update
sudo apt install python3-pip
export PATH=/home/coder/.local/bin:$PATH USER=`whoami`
make development_environment

# set the zsh default shell
chsh -s $(which zsh) # might work
sudo vi /etc/passwd # horrible alternative

# setup keybase
export GPG_TTY=$(tty)
keybase login
keybase pgp export -q=EF080FC8D67F84BC | gpg --import
keybase pgp export -q=EF080FC8D67F84BC --secret > /tmp/key.secret
gpg --allow-secret-key-import --import < /tmp/key.secret
gpg --list-keys --keyid-format SHORT
gpg --expert --edit-key SHORTID
addkey
S E A Q
4096
5y
y
y
quit
y
keybase pgp update --all
echo enable-ssh-support > ~/.gnupg/gpg-agent.conf

# Start or re-use a gpg-agent
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
# add to bottom of .zshrc
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
echo EAB0A4B4A6E3099EDA8D7E7982CAD0E2635DDBD9 >> ~/.gnupg/sshcontrol
ssh-add -l

gpg --export-ssh-key Colin

git config --global user.signingkey chutchic@gmail.com
git config --global commit.gpgsign true
git config --global user.name "Colin Hutchinson"
```
