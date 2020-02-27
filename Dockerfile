FROM openjdk:15-jdk-alpine

COPY libs /home/libs
COPY target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar

export GCP_PROJECT=lab-marceloweb
export GCP_REGION=us-central1

CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
