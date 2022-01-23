#!/usr/bin/with-contenv bashio

PLANTID="$(bashio::config 'plantId')"

echo "Hello $PLANTID!"