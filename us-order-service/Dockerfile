FROM  azul/zulu-openjdk-alpine

ENV SW_AGENT_NAME=ultraseller-order

COPY target/us-order-service-0.0.1-SNAPSHOT.jar /app/us-order-service-0.0.1-SNAPSHOT.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8004
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m   -jar us-order-service-0.0.1-SNAPSHOT.jar"]