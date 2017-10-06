#!/bin/bash
#sed -i.bak  "s/\(storage.dynamodb.client.signing-region *= *\).*/\1us-east-1/g" conf/gremlin-server/dynamodb.properties
env="prod"
if [ -z "$DYNAMO_PREFIX" ]
then
   env="jg"
else
   env=$DYNAMO_PREFIX
fi
if [ -z "$EC2_ZONE" ] 
then
   zone="us-east-1"
else
   zone=$EC2_ZONE
fi
echo $env
echo $zone
sed -i.bak  "s/\(storage.dynamodb.client.signing-region *= *\).*/\1$zone/g" conf/gremlin-server/dynamodb.properties
sed -i.bak "s/\(storage.dynamodb.prefix *= *\).*/\1$env/g" conf/gremlin-server/dynamodb.properties
sed -i.bak "s/\(storage.buffer-size *= *\).*/\14096/g" conf/gremlin-server/dynamodb.properties
sed -i.bak "s/\(storage.dynamodb.client.executor.max-queue-length *=*\).*\18192/g" conf/gremlin-server/dynamodb.properties
sed -i.bak "s/\(storage.dynamodb.client.connection-max *= *\).*/\140/g" conf/gremlin-server/dynamodb.properties
bin/gremlin-server.sh conf/gremlin-server/gremlin-server-edited.yaml
