FROM openjdk:8u201-jdk-alpine3.9
COPY target/us-wallet-service-0.0.1-SNAPSHOT.jar /app/us-wallet-service-0.0.1-SNAPSHOT.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8003
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-wallet-service-0.0.1-SNAPSHOT.jar"]