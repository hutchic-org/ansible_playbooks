.PHONY: setup clean development_environment

# Name of the virtual environment directory
VENV := venv

# Python executable inside the virtual environment
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

development_environment: setup
	ansible-playbook -i "localhost," playbook.yml --ask-become-pass

setup: $(VENV)/bin/activate
	$(PIP) install -r requirements.txt
	$(PIP) freeze > requirements.txt
	test -d galaxy || ansible-galaxy install -p galaxy -f -r requirements.yml

$(VENV)/bin/activate:
	test -d $(VENV) || python3 -m venv $(VENV)
	$(PYTHON) -m pip install --upgrade pip

clean:
	rm -rf galaxy $(VENV)
