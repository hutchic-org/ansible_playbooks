.PHONY: setup

development_environment: setup
	ansible-playbook -i "localhost," playbook.yml

setup:
	pip install -r requirements.txt
	pip freeze --user > requirements.txt
	test -d galaxy || ansible-galaxy install -p galaxy -f -r requirements.yml

clean:
	rm -rf galaxy
