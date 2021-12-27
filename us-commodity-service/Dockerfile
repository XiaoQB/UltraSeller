FROM  azul/zulu-openjdk-alpine

ENV SW_AGENT_NAME=ultraseller-commodity

COPY target/us-commodity-service-1.0-SNAPSHOT.jar /app/us-commodity-service.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8002
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m   -jar us-commodity-service.jar"]