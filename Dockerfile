FROM openjdk:15-jdk-alpine

COPY target/spring-boot-example-canary-SNAPSHOT.jar /home/spring-boot-example-canary-SNAPSHOT.jar

CMD ["java","-jar","/home/spring-boot-example-canary-SNAPSHOT.jar"]
