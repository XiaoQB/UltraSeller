#FROM registry.cn-hangzhou.aliyuncs.com/xywu/openjdk:8-jre-slim
FROM openjdk:8u201-jdk-alpine3.9
COPY target/us-gateway-service-0.0.1-SNAPSHOT.jar /app/us-gateway-service-0.0.1-SNAPSHOT.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-gateway-service-0.0.1-SNAPSHOT.jar"]