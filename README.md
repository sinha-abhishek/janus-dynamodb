## Docker image for setting up janus graph with Dynamo db for backend
This is docker image for running graph database [JanusGraph](http://janusgraph.org/) using [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) as scalable storage backend. This uses the aswlabs project for [Amazon DynamoDB Storage Backend For JanusGraph](https://github.com/awslabs/dynamodb-janusgraph-storage-backend)

## Creating docker image
docker build -t <image_name> .

# Running the image
docker run -it --network=bridge -p <gremlin_server_ws_port>:8182 -e AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY> -e AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> -e EC2_ZONE=<ec2-zone> -e DYNAMO_PREFIX=<prefix> <image_name>


This will create a docker instance which will be hosting janusgraph webscoket port at gremlin_server_ws_port on the host machine. 

# Environment flags explanation
* AWS_ACCESS_KEY_ID : AWS access key for the account with dynamo db write access (mandatory)
* AWS_SECRET_ACCESS_KEY : AWS secret key for account (mandtory)
* EC2_ZONE (optional) : ec2 availability zone for the Dynamo DB. Default value is us-east-1
* DYNAMO_PREFIX (optional) : prefix for dynamo db tables. Default value is 'jg'. Your tables will start with <prefix>_ and be followed by janusgraph specific table names. This is specifically useful if you want to have a development and testing environment using the same docker image. You can set prefix to 'testing' during development phase and set it to 'prod' for the image you want to use on production    

