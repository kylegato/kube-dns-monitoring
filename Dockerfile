FROM alpine:latest
MAINTAINER Kyle Gato <kyle.gato@gmail.com>

ADD monitor.sh /monitor.sh

RUN apk --update add bind-tools bash \
    && chmod +x /monitor.sh

ENTRYPOINT ["/monitor.sh"]
