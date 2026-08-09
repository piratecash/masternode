FROM ubuntu

ARG VERSION="23.1.8"
ARG DAEMON_FILE="piratecashcore-${VERSION}-x86_64-linux-gnu.tar.gz"
ARG DAEMON_URL="https://github.com/piratecash/piratecash/releases/download/v${VERSION}-pirate/${DAEMON_FILE}"

# install dependencies
RUN apt update \
    && apt -y upgrade \
    && apt install -y wget zip unzip tar mc

# download daemon
RUN cd /usr/local/bin \
	&& wget $DAEMON_URL \
	&& tar -xf $DAEMON_FILE

RUN mv /usr/local/bin/piratecashcore-$VERSION/bin/* /usr/local/bin

RUN groupadd --gid 1001 pirate \
    && useradd --uid 1001 --gid pirate -ms /bin/bash pirate

# configure PirateCash node
RUN mkdir -p /home/pirate/.piratecore /home/pirate/bin \
    && chown -R pirate:pirate /home/pirate

USER pirate
WORKDIR /home/pirate
CMD ["/usr/local/bin/piratecashd"]
