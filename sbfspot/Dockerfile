# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
# docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro -v /mnt/media/docker/home-assistant-addons/sbfspot:/data homeassistant/aarch64-builder --aarch64 -t /data
# docker tag swatchy2dot0/aarch64-home-assistant-sbfspot  swatchy2dot0/aarch64-home-assistant-sbfspot:0.1.3
# docker push swatchy2dot0/aarch64-home-assistant-sbfspot:0.1.3

ARG BUILD_FROM
FROM $BUILD_FROM

# RUN export DOCKER_DEFAULT_PLATFORM=linux/aarch64

# Copy data for add-on
COPY run.sh /

USER root

ENV \
    CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt" \
    S6_ARCH="aarch64" \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICES=1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG \
    S6_OVERLAY_VERSION

WORKDIR /usr/src

RUN \
    set -x \
    && apt-get update && apt-get install -y --no-install-recommends \
        bash \
        jq \
        tzdata \
        curl \
        ca-certificates \
    && mkdir -p /usr/share/man/man1

RUN \
    curl -L -f -s "https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-aarch64.tar.gz" \
        | tar zxvf - -C / \
    && mkdir -p /etc/fix-attrs.d \
    && mkdir -p /etc/services.d

RUN \
    curl -L -f -s -o /usr/bin/tempio \
        "https://github.com/home-assistant/tempio/releases/download/2021.09.0/tempio_aarch64" \
    && chmod a+x /usr/bin/tempio

RUN \
    curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/refs/tags/v0.14.3.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 -C /tmp/bashio \
    \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio

RUN \
    rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/src/*

RUN chmod a+x /run.sh

WORKDIR /

USER sbfspot

RUN echo "about to run.sh"

CMD [ "/run.sh" ]