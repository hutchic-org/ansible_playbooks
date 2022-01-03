.PHONY: setup

development_environment: setup
	ansible-playbook -i "localhost," playbook.yml

setup:
	sudo pip install -r requirements.txt
	test -d galaxy || ansible-galaxy install -p galaxy -f -r requirements.yml
	ansible-galaxy collection install pandemonium1986.k8s_toolbox

clean:
	rm -rf galaxy
