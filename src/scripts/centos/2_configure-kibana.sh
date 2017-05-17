#!/bin/bash

ELASTICSEARCH_ADDRESS=${ELASTICSEARCH_ADDRESS:-127.0.0.1}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}
BASE_PATH=${BASE_PATH:-''}

cat <<EOF > /etc/kibana/kibana.yml
server.host: "0.0.0.0"
server.basePath: "$BASE_PATH"
server.maxPayloadBytes: 1048576
server.name: "$HOSTNAME"
elasticsearch.url: "http://$ELASTICSEARCH_ADDRESS:$ELASTICSEARCH_PORT"
elasticsearch.preserveHost: true
kibana.index: ".kibana"
kibana.defaultAppId: "discover"
server.ssl.enabled: false
EOF

service kibana restart
