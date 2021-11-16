#FROM registry.cn-hangzhou.aliyuncs.com/xywu/openjdk:8-jre-slim
FROM openjdk:8u201-jdk-alpine3.9
COPY target/us-order-service-0.0.1-SNAPSHOT.jar /app/us-order-service-0.0.1-SNAPSHOT.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8004
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-order-service-0.0.1-SNAPSHOT.jar"]