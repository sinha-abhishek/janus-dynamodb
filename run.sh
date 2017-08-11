#!/bin/bash
sed -i.bak  "s/\(storage.dynamodb.client.signing-region *= *\).*/\1us-east-1/g" conf/gremlin-server/dynamodb.properties
bin/gremlin-server.sh conf/gremlin-server/gremlin-server-edited.yaml
