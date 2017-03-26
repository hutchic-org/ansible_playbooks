.PHONY: setup

setup:
	test -d .venv || virtualenv --always-copy .venv
	.venv/bin/pip install -r requirements.txt
	.venv/bin/ansible-galaxy install -p galaxy -f -r requirements.yml

new_server:
	.venv/bin/ansible-playbook -i inventory --limit cattle --private-key id_rsa bootstrap_new_server.yml --ask-vault-pass

new_vpc_server:
	.venv/bin/ansible-playbook -i inventory --limit vpc --private-key id_rsa -u root bootstrap_new_server.yml --ask-vault-pass

provision_backup:
	.venv/bin/ansible-playbook -i inventory --private-key id_rsa backup.yml --ask-vault-pass

ssh:
	ssh -i id_rsa -o IdentitiesOnly=yes ubuntu@$$SERVER_IP

clean:
	rm -rf .venv; \
	rm -rf galaxy
