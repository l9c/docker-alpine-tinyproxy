FROM alpine:3.15

RUN apk -U upgrade && apk add bash busybox-extras build-base wget tar ca-certificates && \
    wget -qO - https://github.com/tinyproxy/tinyproxy/releases/download/1.11.2/tinyproxy-1.11.2.tar.gz | tar zxf - -C /tmp && \
    cd /tmp/tinyproxy-1.11.2 && ./autogen.sh && ./configure && make && make install && \
    rm -rf /tmp/tinyproxy-*

VOLUME /usr/local/etc/tinyproxy
EXPOSE 8888
CMD ["tinyproxy", "-d"]