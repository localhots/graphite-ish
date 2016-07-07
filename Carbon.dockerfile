FROM ubuntu:14.04
MAINTAINER Gregory Eremin <g@erem.in>
LABEL app="go-carbon"
LABEL version="0.7.2"
LABEL github="https://github.com/lomik/go-carbon"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y make git golang

RUN mkdir /build
RUN cd /build && git clone https://github.com/lomik/go-carbon.git
WORKDIR /build/go-carbon
RUN git checkout v0.7.2
RUN make submodules && make

RUN mkdir /graphite-config
COPY configs/graphite-api.yml /graphite-config/graphite-api.yml

COPY configs/carbon.toml /etc/carbon.toml
COPY configs/storage-schemas.conf /etc/storage-schemas.conf
EXPOSE 2003 2004 7002
ENTRYPOINT ./go-carbon -config=/etc/carbon.toml
