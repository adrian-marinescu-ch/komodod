FROM	alpine:latest
MAINTAINER	marinescuadrian - https://github.com/marinescuadrian

# Download dependencies & client
RUN	apt-get update && apt-get install -y curl wget build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl3-gnutls-dev bsdmainutils automake
RUN	git clone https://github.com/komodoplatform/komodo && cd komodo/src && ./../zcutil/fetch-params.sh && \
	./../zcutil/build.sh -j$(nproc) && /usr/bin/install -c komodod -t /usr/local/bin/ && \
	cd ../.. && rm -rf komodo

ENTRYPOINT ["komodod"]
