FROM ubuntu:14.04
MAINTAINER Gregory Eremin <g@erem.in>
LABEL app="grafana"
LABEL version="3.0.4"
LABEL github="https://github.com/grafana/grafana"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl make git nodejs npm

RUN cd /tmp && curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
WORKDIR /tmp
RUN tar -xvf go1.6.linux-amd64.tar.gz
RUN mv go /usr/local
RUN mkdir /go
ENV PATH $PATH:/usr/local/go/bin:/go/bin
ENV GOPATH /go
RUN go version
RUN go env

RUN go get -d -v github.com/grafana/grafana || true
WORKDIR /go/src/github.com/grafana/grafana
RUN git checkout v3.0.4

RUN go run build.go setup
RUN rm -rf Godeps/_workspace
RUN godep restore
RUN go run build.go build
RUN npm install
RUN npm run build

# COPY configs/carbon.toml /etc/carbon.toml
# COPY configs/storage-schemas.conf /etc/storage-schemas.conf
# RUN mkdir -p /data/graphite/whisper
# EXPOSE 2003 2004 7002
# ENTRYPOINT ./go-carbon -config=/etc/carbon.toml
ENTRYPOINT sleep 1000
