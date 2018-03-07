FROM debian:jessie
MAINTAINER Ronalds Sovas <vk@dosje.in>

RUN useradd -ms /bin/bash tor \
	&& echo "tor\ntor"  |passwd tor \
	&& echo "tor\ntor"  |passwd root \
	&& set -xe \
    && apt-get update \
    && apt-cache policy netcat-openbsd \
    && apt-get install -y autoconf \
                          wget \
                          tor \
                          ssh \
                          sudo \
                          netcat-openbsd \
                          openssh-server \
                          screen


ADD alias.txt /.alias

ADD start.sh /start.sh
RUN chmod 777 /start.sh

ADD report.sh /report.sh
RUN chmod 777 /report.sh

CMD ["/start.sh"]
