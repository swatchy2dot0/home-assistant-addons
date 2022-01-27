# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
# docker run --rm --privileged -v ~/.docker:/root/.docker -v /<yourAddonsRootAbsolutePath>/home-assistant-addons/sbfspot:/data homeassistant/amd64-builder --armv7 -t /data
ARG BUILD_FROM
FROM $BUILD_FROM

RUN export DOCKER_DEFAULT_PLATFORM=linux/aarch64  

# Copy data for add-on
COPY run.sh /

USER root

RUN chmod a+x /run.sh

USER sbfspot

CMD [ "/run.sh" ]