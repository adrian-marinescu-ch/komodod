FROM	ubuntu:xenial
MAINTAINER	marinescuadrian - https://github.com/marinescuadrian

ENV	HOME /komodo-user

RUN 	groupadd -g 1000 coin-daemons \
    	&& useradd -u 1000 -g coin-daemons -s /bin/bash -m -d ${HOME} komodo-user

# Download dependencies & client
RUN	apt-get update && apt-get install -y curl wget build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl3-gnutls-dev bsdmainutils automake
RUN	git clone https://github.com/komodoplatform/komodo && cd komodo/src && ./../zcutil/fetch-params.sh && \
	./../zcutil/build.sh -j$(nproc) && /usr/bin/install -c komodod -t /usr/local/bin/ && \
	cd ../.. && rm -rf komodo
	
# Prepare config
RUN 	chown komodo-user:coin-daemons -R /komodo-user

USER komodo-user

WORKDIR ${HOME}

ENTRYPOINT ["komodod"]