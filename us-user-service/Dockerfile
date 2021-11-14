FROM openjdk:8u201-jdk-alpine3.9
COPY target/us-user-service-0.0.1-SNAPSHOT.jar /app/us-user-service.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8002
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-user-service.jar"]