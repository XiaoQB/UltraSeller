FROM registry.cn-hangzhou.aliyuncs.com/xywu/openjdk:8-jre-slim
COPY target/us-user-service-1.0-SNAPSHOT.jar /app/us-user-service.jar

ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8002
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar us-user-service.jar"]