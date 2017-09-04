.PHONY: setup clean run

setup:
	ansible-galaxy install -p galaxy -f -r requirements.yml

clean:
	rm -rf galaxy

run:
	ansible-playbook playbook.yml
