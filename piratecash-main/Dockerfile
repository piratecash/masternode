FROM ubuntu

ARG VERSION="18.2.2"
ARG DAEMON_FILE="piratecashcore-${VERSION}-x86_64-pc-linux-gnu.tar.bz2"
ARG DAEMON_URL="https://github.com/piratecash/piratecash/releases/download/v${VERSION}/${DAEMON_FILE}"

# install dependencies
RUN apt update \
    && apt -y upgrade \
    && apt install -y wget bzip2 zip unzip tar cron python3-pip python3-requests git python3 virtualenv mc sqlite3 \
    && pip3 install python-bitcoinrpc --break-system-packages

# download daemon
RUN cd /usr/local/bin \
	&& wget $DAEMON_URL \
	&& bzip2 -dc $DAEMON_FILE | tar -x

RUN useradd -ms /bin/bash pirate

# copy config to Pirate user
USER pirate
# install sentinel
WORKDIR /home/pirate
RUN git clone https://github.com/piratecash/sentinel
WORKDIR /home/pirate/sentinel
RUN virtualenv -p $(which python3) ./venv
RUN ./venv/bin/pip install -r requirements.txt
# configure PirateCash node
RUN mkdir -p /home/pirate/.piratecore
RUN mkdir -p /home/pirate/bin
COPY crontab /tmp/crontab
RUN crontab -u pirate /tmp/crontab

USER root

COPY start.sh /opt/start.sh
RUN chmod a+x /opt/start.sh

WORKDIR /root
CMD ["/bin/bash"]
