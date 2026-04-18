FROM alpine:latest
RUN apk add --no-cache kubectl docker-cli docker-compose ca-certificates bash curl git openssh-client net-tools iproute2 \
    && apk add --no-cache --virtual .op-deps unzip \
    && curl -fsSL https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.0/op_linux_amd64_v2.30.0.zip -o /tmp/op.zip \
    && unzip /tmp/op.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/op \
    && rm /tmp/op.zip \
    && apk del .op-deps
WORKDIR /root
CMD ["sleep", "infinity"]
