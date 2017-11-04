FROM resin/armv7hf-debian:stretch

ENV DOWNLOAD_URL https://github.com/fg2it/grafana-on-raspberry/releases/download/v4.6.0/grafana_4.6.0_armhf.deb

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get -y --no-install-recommends install libfontconfig curl ca-certificates && \
    apt-get clean && \
    curl -L ${DOWNLOAD_URL} > /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb && \
    curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-armhf > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

COPY ./run.sh /run.sh

RUN chmod 0755 /run.sh

ENTRYPOINT ["/run.sh"]

RUN [ "cross-build-end" ]