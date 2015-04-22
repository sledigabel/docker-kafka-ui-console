FROM ubuntu
MAINTAINER Sebastien Le Digabel <sledigab@cisco.com>


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl wget git unzip openjdk-7-jre openjdk-7-jdk
RUN wget http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2.zip -O /tmp/typesafe-activator-1.3.2.zip
RUN cd /tmp && unzip typesafe-activator-1.3.2.zip
RUN cd /tmp && git clone https://github.com/claudemamo/kafka-web-console.git
RUN cd /tmp/kafka-web-console && /tmp/activator-1.3.2/activator dist
RUN cd /tmp/kafka-web-console && /tmp/activator-1.3.2/activator stage

EXPOSE 9000

WORKDIR /tmp/kafka-web-console/target/universal/stage
CMD bin/kafka-web-console -DapplyEvolutions.default=true
