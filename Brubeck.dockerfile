FROM ubuntu:14.04
MAINTAINER Gregory Eremin <g@erem.in>
LABEL app="brubeck"
LABEL github="https://github.com/github/brubeck"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y make git libjansson-dev libssl-dev libmicrohttpd-dev

RUN mkdir /build
RUN cd /build && git clone https://github.com/github/brubeck.git
WORKDIR /build/brubeck
RUN git checkout 5d139a44206813640151cf0af17d32ee9ac41a60
RUN ./script/bootstrap

COPY configs/brubeck.json /etc/brubeck.json
EXPOSE 8080 8126 9126
ENTRYPOINT ./brubeck --config=/etc/brubeck.json
