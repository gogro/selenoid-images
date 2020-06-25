FROM golang:1.14 as go

ARG VERSION

COPY devtools /devtools

RUN \
    apt-get update && \
    apt-get install -y upx-ucl && \
    cd /devtools && \
    go test -race && \
    GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" && \
    upx /devtools/devtools

FROM selenoid/base:6.0

ARG VERSION
ARG CLEANUP

LABEL browser=chromium-browser:$VERSION

RUN \
        ( [ "$CLEANUP" != "true" ] && rm -f /etc/apt/apt.conf.d/docker-clean ) || true && \
        apt-get update && \
        apt-get -y --no-install-recommends install iproute2 chromium-browser=$VERSION chromium-chromedriver=$VERSION && \
        chromium-browser --version && \
        ($CLEANUP && rm -Rf /tmp/* && rm -Rf /var/lib/apt/lists/*) || true

ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
COPY --from=go /devtools/devtools /usr/bin/
COPY entrypoint.sh /

USER selenium

EXPOSE 4444
ENTRYPOINT ["/entrypoint.sh"]