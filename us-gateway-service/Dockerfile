FROM  azul/zulu-openjdk-alpine

ENV SW_AGENT_NAME=ultraseller-gateway

COPY target/us-gateway-service-0.0.1-SNAPSHOT.jar /app/us-gateway-service-0.0.1-SNAPSHOT.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m   -jar us-gateway-service-0.0.1-SNAPSHOT.jar"]