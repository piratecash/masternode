FROM ubuntu

ARG VERSION="19.1.0"
ARG DAEMON_FILE="piratecashcore-${VERSION}-x86_64-pc-linux-gnu.tar.bz2"
ARG DAEMON_URL="https://github.com/piratecash/piratecash/releases/download/v${VERSION}-pirate/${DAEMON_FILE}"

# install dependencies
RUN apt update \
    && apt -y upgrade \
    && apt install -y wget bzip2 zip unzip tar mc

# download daemon
RUN cd /usr/local/bin \
	&& wget $DAEMON_URL \
	&& bzip2 -dc $DAEMON_FILE | tar -x

RUN groupadd --gid 1001 pirate \
    && useradd --uid 1001 --gid pirate -ms /bin/bash pirate

# configure PirateCash node
RUN mkdir -p /home/pirate/.piratecore /home/pirate/bin \
    && chown -R pirate:pirate /home/pirate

USER pirate
WORKDIR /home/pirate
CMD ["/usr/local/bin/piratecashd"]
