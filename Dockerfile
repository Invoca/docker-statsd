# Dockerfile for statsd

FROM node:6

RUN git clone -b v0.8.0 --single-branch https://github.com/etsy/statsd.git /usr/local/src/statsd

RUN \
  cp -v /usr/local/src/statsd/exampleConfig.js /etc/default/config.js && \
  sed -i 's/graphite.example.com/graphite/' /etc/default/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

ENTRYPOINT [ "node", "/usr/local/src/statsd/stats.js", "/etc/default/config.js" ]
