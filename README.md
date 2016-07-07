# Graphite-ish

Original [Graphite](http://graphiteapp.org/) stack is written in Python and it's
speed could have been better. Luckily it is possible to replace original stack
with other components that have [better](https://github.com/lomik/go-carbon/tree/v0.7.2#performance)
performance. Quite [impressive](https://github.com/github/brubeck/tree/5d139a4#faq).

Grafana 3 is also included.

**Included software:**

* [go-carbon](https://github.com/lomik/go-carbon/tree/v0.7.2) `v0.7.2`
* [Brubeck](https://github.com/github/brubeck/tree/5d139a4) `5d139a4`
* [Grafana](https://github.com/grafana/grafana/tree/v3.0.4) `v3.0.4`

**Local installation:**

```
make graphite fast
```

**Re-installation:**

```
make graphite fast again
```
