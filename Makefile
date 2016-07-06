graphite:
	docker build -t localhots/carbon:v1 -f Carbon.dockerfile .
	docker build -t localhots/brubeck:v1 -f Brubeck.dockerfile .
	docker run -d --name carbon \
		-p 2003:2003 \
		-p 2004:2004 \
		-p 7002:7002 \
		localhots/carbon:v1
	docker run -d --name brubeck --link carbon:carbon \
		-p 8080:8080 \
		-p 8126:8126 \
		-p 9126:9126 \
		localhots/brubeck:v1
