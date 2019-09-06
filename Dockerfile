FROM ubuntu:18.04

# Dockerfile for running Binance node from binary packages under docker
# https://docs.binance.org/fullnode.html#run-full-node-to-join-binance-chain
# MIT license
LABEL Maintainer = "Evgeny Varnavskiy <varnavruz@gmail.com>"
LABEL Description="Docker image for Banxcoin node"
LABEL License="MIT License"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&& apt-get install -y --no-install-recommends build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler unzip software-properties-common wget \
&& add-apt-repository ppa:bitcoin/bitcoin \
&& apt-get update \
&& apt-get -y --no-install-recommends install libdb4.8-dev libdb4.8++-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN wget -q "https://github.com/Banxcoin-BXN/Wallets/raw/master/banxcoin-daemon-linux.tar.gz" -O banxcoin-daemon-linux.tar.gz \
&& wget -q "https://github.com/Banxcoin-BXN/Wallets/raw/master/banxcoin-qt-linux.tar.gz" -O banxcoin-qt-linux.tar.gz \
&& tar xf banxcoin-daemon-linux.tar.gz \
&& tar xf banxcoin-qt-linux.tar.gz \
&& mv banxcoind banxcoin-cli banxcoin-tx /usr/bin/ \
&& useradd --shell /bin/bash banxcoind

COPY ./bin/*.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT ["entrypoint.sh"]