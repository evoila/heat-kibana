#!/bin/bash

# Expected parameters
VERSION=${VERSION:-5.4.0}

# Install elasticsearch
curl -o /tmp/kibana.deb https://artifacts.elastic.co/downloads/kibana/kibana-$VERSION-amd64.deb
dpkg -i /tmp/kibana.deb

service kibana status > /dev/null
SERVICE_STATUS=$?

if [ $SERVICE_STATUS -eq 0 ]; then
  service kibana restart
fi
