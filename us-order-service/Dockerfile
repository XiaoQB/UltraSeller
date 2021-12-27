FROM registry.cn-hangzhou.aliyuncs.com/lavenpok/skywalking-agent:1.0
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
ENV SW_AGENT_NAME=ultraseller-order

COPY target/us-order-service-0.0.1-SNAPSHOT.jar /app/us-order-service-0.0.1-SNAPSHOT.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8004
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m   -jar us-order-service-0.0.1-SNAPSHOT.jar"]