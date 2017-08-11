## Docker image for setting up janus graph with Dynamo db for backend
his is docker image for running graph database [JanusGraph](http://janusgraph.org/) using [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) as scalable storage backend. This uses the aswlabs project for [Amazon DynamoDB Storage Backend For JanusGraph](https://github.com/awslabs/dynamodb-janusgraph-storage-backend)

## Creating docker image
docker build -t <image_name> .

# Running the image
docker run -it --network=bridge -p <gremlin_server_ws_port>:8182 -e AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY> -e AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> <image_name>

This will create a docker instance which will be hosting janusgraph webscoket port at gremlin_server_ws_port on the host machine. The DynamoDB backend being used is at us-east. In case you want to change it you can edit the run.sh to change the zone

