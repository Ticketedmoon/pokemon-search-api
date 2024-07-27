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

fetch-cert-from-docker-container:
	mkdir -p es-cert
	docker cp pokemon-search-api-es01-1:/usr/share/elasticsearch/config/certs/ca/ca.crt ./es-cert/ca.crt

test-cluster:
	curl --cacert ./es-cert/ca.crt -u elastic:$(ES_PASSWORD) https://localhost:9200


.PHONY: 
	start-venv setup test
