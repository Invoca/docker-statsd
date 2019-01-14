# Dockerfile for statsd

FROM node:6
ENV VERSION=v0.8.0
RUN wget -O /tmp/statsd.tgz https://github.com/Invoca/statsd/archive/${VERSION}.tar.gz \
    && mkdir /usr/local/src/statsd \
    && tar -zxvf /tmp/statsd.tgz --strip 1 -C /usr/local/src/statsd \
    && rm /tmp/statsd.tgz \
    && cd /usr/local/src/statsd \
    && npm install \
    && cp -v /usr/local/src/statsd/exampleConfig.js /etc/default/config.js \
    && sed -i 's/graphite.example.com/graphite/' /etc/default/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

ENTRYPOINT [ "node", "/usr/local/src/statsd/stats.js", "/etc/default/config.js" ]
