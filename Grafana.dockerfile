FROM ubuntu:14.04
MAINTAINER Gregory Eremin <g@erem.in>
LABEL app="grafana"
LABEL version="3.1.0-beta1"
LABEL github="https://github.com/grafana/grafana"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl make git build-essential

# Installing Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs && node -v && npm -v

# Installing Go
RUN cd /tmp && curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
WORKDIR /tmp
RUN tar -xvf go1.6.linux-amd64.tar.gz
RUN mv go /usr/local
RUN mkdir /go
# Setting up Go environment
ENV PATH $PATH:/usr/local/go/bin:/go/bin
ENV GOPATH /go
RUN go version && go env

# Building Grafana

RUN go get -d -v github.com/grafana/grafana || true
WORKDIR /go/src/github.com/grafana/grafana
RUN git checkout v3.1.0-beta1

RUN go run build.go setup
RUN rm -rf Godeps/_workspace
RUN godep restore
RUN go run build.go build

RUN npm install
RUN npm run build

EXPOSE 3000
ENTRYPOINT ./bin/grafana-server
