FROM ubuntu:14.04
MAINTAINER Gregory Eremin <g@erem.in>
LABEL app="brubeck"
LABEL github="https://github.com/github/brubeck"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y libjansson-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libmicrohttpd-dev
RUN apt-get install -y git
RUN apt-get install -y make

RUN mkdir /build
RUN cd /build && git clone https://github.com/github/brubeck.git
WORKDIR /build/brubeck
RUN ./script/bootstrap

COPY configs/brubeck.json /etc/brubeck.json
EXPOSE 8080 8126 9126
ENTRYPOINT ./brubeck --config=/etc/brubeck.json
