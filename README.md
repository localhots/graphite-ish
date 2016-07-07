# Graphite-ish

Original [Graphite](http://graphiteapp.org/) stack is written in Python and it
could really use some improvements performance-wise. Luckily it is possible to
replace original stack with other components that have
[better](https://github.com/lomik/go-carbon/tree/v0.7.2#performance) performance.
Quite [impressive](https://github.com/github/brubeck/tree/5d139a4#faq).

Reading metrics from Whisper and performing all the transformations on them is
done by [Graphite API](https://github.com/brutasse/graphite-api), a Python app.

Grafana 3 is also included.

**Included software:**

* [go-carbon](https://github.com/lomik/go-carbon/tree/v0.7.2) `v0.7.2`
* [Brubeck](https://github.com/github/brubeck/tree/5d139a4) `5d139a4`
* [Graphite API](https://github.com/brutasse/graphite-api) `latest`
* [Grafana](https://github.com/grafana/grafana/tree/v3.1.0-beta1) `v3.1.0-beta1`

**Local installation:**

Make sure [Docker](https://www.docker.com/products/docker) and
[Docker Compose](https://www.docker.com/products/docker-compose) are installed.

```
make graphite fast
```

**Re-installation:**

```
make graphite fast again
```
