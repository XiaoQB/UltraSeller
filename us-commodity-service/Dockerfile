FROM registry.cn-hangzhou.aliyuncs.com/lavenpok/skywalking-agent:1.0
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
ENV SW_AGENT_NAME=ultraseller-commodity

COPY target/us-commodity-service-1.0-SNAPSHOT.jar /app/us-commodity-service.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8002
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m -javaagent:/skywalking/agent/skywalking-agent.jar -jar us-commodity-service.jar"]