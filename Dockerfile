FROM openjdk:15-jdk-alpine

COPY target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar

ENV GCP_PROJECT=lab-marceloweb
ENV GCP_REGION=us-central1

CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
