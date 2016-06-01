FROM ubuntu:latest
MAINTAINER Rob Shad <robertmshad@googlemail.com>
ENV APTLIST="lftp wget"

RUN apt-get update -q && \
  apt-get install $APTLIST -qy && \
  apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD scripts/ /scripts/
RUN rm -f /tmp/autounrar.pid && \

  echo "Setting file permissions" && \
  chmod -v +x /scripts/autounrar && \

  echo "Adding cron job" && \
  crontab -l | { cat; echo "*/5 * * * * /scripts/autounrar"; } | crontab -

# Volumes and Ports
VOLUME ["/input", "/output", "/config"]
