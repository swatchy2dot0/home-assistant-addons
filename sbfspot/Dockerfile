# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
# docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro -v /mnt/media/docker/home-assistant-addons/sbfspot:/data homeassistant/aarch64-builder --aarch64 -t /data
# docker tag swatchy2dot0/aarch64-home-assistant-sbfspot  swatchy2dot0/aarch64-home-assistant-sbfspot:0.1.3
# docker push swatchy2dot0/aarch64-home-assistant-sbfspot:0.1.3

ARG BUILD_FROM
FROM $BUILD_FROM

RUN export DOCKER_DEFAULT_PLATFORM=linux/aarch64

# Copy data for add-on
COPY run.sh /

USER root

RUN \
    apt-get update \
    \
    && apt-get install curl -y \
    \
    && curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/v0.14.3.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 -C /tmp/bashio \
    \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio

RUN chmod a+x /run.sh

USER sbfspot

CMD [ "/run.sh" ]