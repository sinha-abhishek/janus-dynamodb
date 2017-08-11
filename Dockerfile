FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get install -y wget
RUN apt-get install -y zip
RUN apt-get install -y maven
RUN apt-get update -y
#RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
#RUN apt-get install -y apache-maven sqlite-devel git java-1.8.0-openjdk-devel

#RUN yum update -y && sudo yum upgrade -y
#RUN yum install -y apache-maven sqlite-devel git java-1.8.0-openjdk-devel
#RUN  alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
#RUN alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y unzip curl oracle-java8-installer

ADD setup.sh /opt/
RUN bash /opt/setup.sh
ADD run.sh /opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master/server/dynamodb-janusgraph-storage-backend-1.1.0
RUN chmod +x /opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master/server/dynamodb-janusgraph-storage-backend-1.1.0/run.sh

RUN sed  "s/\(host *: *\).*/\10.0.0.0/" /opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master/server/dynamodb-janusgraph-storage-backend-1.1.0/conf/gremlin-server/gremlin-server.yaml > /opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master/server/dynamodb-janusgraph-storage-backend-1.1.0/conf/gremlin-server/gremlin-server-edited.yaml

EXPOSE 8182
#EXPOSE 8183
#EXPOSE 8184
EXPOSE 80
WORKDIR /opt/dynamodb-janusgraph/dynamodb-janusgraph-storage-backend-master/server/dynamodb-janusgraph-storage-backend-1.1.0/
#CMD ["ls"]
CMD ["sh","run.sh"]
