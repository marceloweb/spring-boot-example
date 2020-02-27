FROM openjdk:15-jdk-alpine

COPY target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar

CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
