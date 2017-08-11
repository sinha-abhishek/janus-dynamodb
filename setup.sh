#!/bin/bash
export GREMLIN_SERVER_USERNAME='ec2-user'
export LOG_DIR=/var/log/gremlin-server
export SERVER_DIRNAME=dynamodb-janusgraph-storage-backend-1.1.0
export SERVER_ZIP=${SERVER_DIRNAME}.zip
export PACKAGES_DIR=/usr/local/packages
export INSTALL_DIR=${PACKAGES_DIR}/${SERVER_DIRNAME}
export REPO_ARCHIVE_DIR=/opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master
mkdir -p ${LOG_DIR} ${INSTALL_DIR}
mkdir -p $REPO_ARCHIVE_DIR
export SERVICE_SCRIPT=${INSTALL_DIR}/bin/gremlin-server-service.sh
pushd /opt/dynamodb-janusgraph/
wget https://github.com/awslabs/dynamodb-janusgraph-storage-backend/archive/master.zip && unzip  master.zip
pushd ${REPO_ARCHIVE_DIR}
mvn install
bash src/test/resources/install-gremlin-server.sh && popd && popd
#pushd ${PACKAGES_DIR}
#mv ${REPO_ARCHIVE_DIR}/server/${SERVER_DIRNAME} . && rm -rf /dev/shm/* && chmod u+x ${SERVICE_SCRIPT} && ln -s ${SERVICE_SCRIPT} /etc/init.d/gremlin-server && chkconfig --add gremlin-server
#export BACKEND_PROPERTIES=${INSTALL_DIR}/conf/gremlin-server/dynamodb.properties
#chown -R ${GREMLIN_SERVER_USERNAME}:${GREMLIN_SERVER_USERNAME} ${LOG_DIR} ${INSTALL_DIR}
#ln -s ${INSTALL_DIR}/conf /home/ec2-user/conf && chmod a+r /home/ec2-user/conf
#service gremlin-server start"
#https://github.com/awslabs/dynamodb-janusgraph-storage-backend/archive/master.zip