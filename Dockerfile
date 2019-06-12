FROM ubuntu:18.04

COPY ./httptunnel/larsbrinkhoff-httptunnel-f440dcb.tar.gz /data/src

RUN set -x && \
	\
# Install dependencies
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential autoconf && \
	\
# Compile
	cd /data/src && \ 
	tar -xf /data/src/*.tar.gz --strip 1
	./autogen.sh && \
	./configure && \
	make && \
	make install && \
	\
# Remove cache
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/apt/lists/*

