FROM registry.cn-hangzhou.aliyuncs.com/xywu/openjdk:8-jre-slim
COPY target/us-commodity-service-1.0-SNAPSHOT.jar /app/us-commodity-service.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8003
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-commodity-service.jar"]