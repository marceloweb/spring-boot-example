FROM openjdk:15-jdk-alpine

COPY target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

RUN cd /home/ && curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-282.0.0-linux-x86_64.tar.gz && tar zxvf google-cloud-sdk-282.0.0-linux-x86_64.tar.gz

ENV GCP_PROJECT=lab-marceloweb
ENV GCP_REGION=us-central1

CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
