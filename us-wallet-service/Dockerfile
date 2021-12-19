FROM registry.cn-hangzhou.aliyuncs.com/lavenpok/skywalking-agent:1.0
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
ENV SW_AGENT_NAME=ultraseller-wallet

COPY target/us-wallet-service-0.0.1-SNAPSHOT.jar /app/us-wallet-service-0.0.1-SNAPSHOT.jar
ENV LANG C.UTF-8

WORKDIR /app
EXPOSE 8003
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Xmx200m -javaagent:/skywalking/agent/skywalking-agent.jar -jar us-wallet-service-0.0.1-SNAPSHOT.jar"]