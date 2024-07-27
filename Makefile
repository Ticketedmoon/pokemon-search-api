APPLICATION_ENTRY="./src/code/main.py"

setup:
	pip install -r requirements.txt

test:
	py.test tests

clean:
	rm -rf __pycache__

new-venv:
	python3 -m venv ./venv

start-server:
	fastapi dev ${APPLICATION_ENTRY}

.PHONY: 
	start-venv setup test
