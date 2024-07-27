setup:
	pip install -r requirements.txt

test:
	py.test tests

clean:
	rm -rf __pycache__

.PHONY: 
	setup test
