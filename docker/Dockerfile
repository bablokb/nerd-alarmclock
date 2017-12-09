# Pull base image
FROM raspbian/jessie
MAINTAINER Benjamin Fuchs <rpi@benjaminfuchs.de>

# Install packages
RUN apt-get update && apt-get install -y \
	git \
	vim \
	alsa-utils \
	libpulse0 \
    wiringpi \
    python-pip \
    python-blinkt \
    python-simplejson \
    python-fourletterphat \
    python-flask \
    mpg123 \
    lighttpd

ARG user=nerdc
ARG group=nerdc
ARG uid=1000
ARG gid=1000
ENV HOME /var/nerdc_home

# Add user user
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$HOME" -u ${uid} -g ${gid} -G audio,i2c,nerdc,video -m -s /bin/bash ${user}

VOLUME "$HOME"

WORKDIR /var/lib
# This argument is a trick to force rebuild by changes in the repo
ARG INCUBATOR_VER=unknown
RUN INCUBATOR_VER=${INCUBATOR_VER} git clone https://github.com/benjaminfuchs/nerd-alarmclock.git \
    && cd nerd-alarmclock \
    && tools/install \
    && cd - \
    && git clone https://github.com/bablokb/gpio-poll-service.git \
    && cd gpio-poll-service \
    && tools/install

ADD etc/nerd-alarmclock.conf /etc/nerd-alarmclock.conf
ADD etc/lighttpd/ /etc/lighttpd/
ADD var/www/ /var/www/
ADD usr/local/sbin/ /usr/local/sbin/

RUN chown -R nerdc:nerdc /var/www/ \
    && chown nerdc:nerdc /usr/sbin/lighttpd \
    && chown -R ${user} "$HOME" \
    && chmod -R +x /usr/local/sbin/ \
    && setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/lighttpd

WORKDIR "$HOME"
USER ${user}
CMD ["/bin/bash", "start-nerdc.sh"]
