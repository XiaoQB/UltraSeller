FROM openjdk:8

ARG APP_NAME
ENV APP_NAME=${APP_NAME}

# 设置文件操作权限
RUN groupadd -g 500 admin && \
useradd -u 500 -g admin admin && \
mkdir -p /home/admin && \
chmod +rx -R /home/admin

COPY ./target/${APP_NAME}.jar /home/admin/${APP_NAME}/target/${APP_NAME}.jar
COPY ./start.sh /home/admin/start.sh

RUN chmod +x /home/admin/*.sh

WORKDIR /home/admin

ENTRYPOINT ["/home/admin/start.sh"]