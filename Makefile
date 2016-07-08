graphite:
	docker-compose build

fast:
	@echo "Graphite is fast now!"

again:

build: graphite

run:
	docker-compose up
