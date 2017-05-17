#!/bin/bash

# Expected parameters
VERSION=${VERSION:-5.4.0}

# Install elasticsearch
curl -o /tmp/kibana.rpm https://artifacts.elastic.co/downloads/kibana/kibana-$VERSION-x86_64.rpm
rpm -i /tmp/kibana.rpm

service kibana status > /dev/null
SERVICE_STATUS=$?

if [ $SERVICE_STATUS -eq 0 ]; then
  service kibana restart
fi
