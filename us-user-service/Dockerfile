FROM registry.cn-hangzhou.aliyuncs.com/lavenpok/skywalking-agent:1.0
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
ENV SW_AGENT_NAME=ultraseller-user

ADD ./target/us-user-service-0.0.1-SNAPSHOT.jar /app/
CMD ["java", "-Xmx200m", "-javaagent:/skywalking/agent/skywalking-agent.jar",  "-jar", "/app/us-user-service-0.0.1-SNAPSHOT.jar"]

EXPOSE 8001
