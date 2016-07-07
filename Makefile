graphite:
	@echo "Building Carbon"
	docker build -t localhots/carbon:v1 -f Carbon.dockerfile .
	@echo "Starting Carbon"
	docker run -d --name carbon \
		-p 2003:2003 \
		-p 2004:2004 \
		-p 7002:7002 \
		-v /data/graphite/whisper /var/whisper \
		localhots/carbon:v1

	@echo "Building Brubeck"
	docker build -t localhots/brubeck:v1 -f Brubeck.dockerfile .
	@echo "Starting Brubeck"
	docker run -d --name brubeck --link carbon:carbon \
		-p 8080:8080 \
		-p 8126:8126 \
		-p 9126:9126 \
		localhots/brubeck:v1

	@echo "Building Grafana"
	docker build -t localhots/grafana:v1 -f Grafana.dockerfile .
	@echo "Starting Grafana"
	docker run -d --name grafana --link carbon:carbon --link brubeck:brubeck \
		-p 3000:3000 \
		localhots/grafana:v1

fast:
	@echo "Graphite is fast now!"

again:
