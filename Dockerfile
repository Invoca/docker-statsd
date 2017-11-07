# Dockerfile for statsd

FROM axisk/nodejs

RUN git clone -b v0.8.0 --single-branch https://github.com/etsy/statsd.git /usr/local/src/statsd

ADD ./etc/config.js ./etc/default/statsd.js

ENV GRAPHITE_GLOBAL_PREFIX stats
ENV GRAPHITE_LEGACY_NAMESPACE false
ENV GRAPHITE_PREFIX_COUNTER counters
ENV GRAPHITE_PREFIX_TIMER timers
ENV GRAPHITE_PREFIX_GAUGE gauges
ENV GRAPHITE_PREFIX_SET sets

ENV STATSD_PORT 8125
ENV STATSD_DUMP_MSG false
ENV STATSD_DEBUG false
ENV STATSD_FLUSH_INTERVAL 60000

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD node /usr/local/src/statsd/stats.js /etc/default/statsd.js