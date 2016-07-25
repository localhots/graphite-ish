# Graphite-ish

[Graphite](http://graphiteapp.org/) project consists of three components that designed to work together:

* `carbon` daemon that accepts and stores metrics
* `whisper` database where metrics are kept
* `web` app that reads metrics and processes them using a comprehensive list of
supported functions

Every component exposes several APIs that are used by other components. All of
them are written in Python.

Two more components are often used together with `Graphite`:

* [StatsD](https://github.com/etsy/statsd) — a Node.js app that accepts metrics
and aggregates them before submitting to `carbon`;
* [Grafana](https://github.com/grafana/grafana) — web dashboard for `Graphite` (and
other backends)

### So what?

This set of images replaces original `carbon` daemon and `StatsD` aggregation
daemon with other compatible components to improve
[performance](https://github.com/lomik/go-carbon/tree/v0.7.2#performance) and
[throughput](https://github.com/github/brubeck/tree/5d139a4#faq).

Grafana 3 is also included.

### Included images
| Component | Version |   |
|-----------|---------|---|
| [go-carbon](https://github.com/lomik/go-carbon/tree/v0.7.2) | `v0.7.2` | Drop-in replacement for original `carbon` daemon, written in Go |
| [Brubeck](https://github.com/github/brubeck/tree/5d139a4) | `5d139a4` | Easy replacement for `StatsD`, written in C |
| [Graphite API](https://github.com/brutasse/graphite-api) | `latest` | A piece of original `Graphite Web` component with less features |
| [Grafana](https://github.com/grafana/grafana/tree/v3.1.0-beta1) | `v3.1.0-beta1` | Beautiful dashboard for all of that |

## Building

Make sure [Docker](https://www.docker.com/products/docker) and
[Docker Compose](https://www.docker.com/products/docker-compose) are installed.

```bash
$ make graphite fast
```

### Re-building

```bash
$ make graphite fast again
```

## Starting

```bash
$ make run
```

## Using

* Open `Grafana` dashboard at `http://[docker-host]:3000/`, sign in as `admin`/`admin`
* Create new data source of type `Graphite` that points to `http://graphite-api:8000`
* Create a new chart with a test metric (`test.ping` in this example)
* Start sending metrics to `StatsD`-compatible endpoint
* Metrics should show up on `Grafana` dashboard

You can send metrics right from terminal:

```bash
# 1000 times
# Send "test.ping:1|C\n"
# Verbose, Using UDP, Timeout 1s
# To StatsD port on Docker
$ for i in {1..1000}; do echo "test.ping:1|C" | nc -v -u -w1 `docker-machine ip` 8126; done
```

Data is kept in `/data/graphite/whisper` directory on the host machine.
