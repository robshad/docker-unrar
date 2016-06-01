FROM ubuntu:latest
MAINTAINER Rob Shad <robertmshad@googlemail.com>
ENV APTLIST="lftp wget"

RUN apt-get update -q && \
  apt-get install $APTLIST -qy && \
  apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD init/ /etc/my_init.d/
ADD scripts/ /scripts/
RUN chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME ["/input", "/output", "/config"]
