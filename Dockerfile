FROM openjdk:15-jdk-alpine

COPY libs/google-cloud-sdk-282.0.0-linux-x86_64.tar.gz /home/google-cloud-sdk-282.0.0-linux-x86_64.tar.gz
COPY target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar

RUN /home/ && tar zxvf google-cloud-sdk-282.0.0-linux-x86_64.tar.gz

ENV GCP_PROJECT=lab-marceloweb
ENV GCP_REGION=us-central1

CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
