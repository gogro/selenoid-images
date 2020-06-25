FROM selenoid/base:6.0

ARG VERSION=83.0.4103.61-0ubuntu0.18.04.1
ARG CLEANUP
ARG PACKAGE=chromium-browser

LABEL browser=$PACKAGE:$VERSION

RUN \
        ( [ "$CLEANUP" != "true" ] && rm -f /etc/apt/apt.conf.d/docker-clean ) || true && \
        apt-get update && \
        apt-get -y --no-install-recommends install iproute2 $PACKAGE=$VERSION chromium-chromedriver=$VERSION && \
        chromium-browser --version && \
        ($CLEANUP && rm -Rf /tmp/* && rm -Rf /var/lib/apt/lists/*) || true