FROM openjdk:8u201-jdk-alpine3.9
COPY target/us-commodity-service-1.0-SNAPSHOT.jar /app/us-commodity-service.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8002
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-commodity-service.jar"]