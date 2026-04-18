FROM alpine:latest AS builder
RUN apk add --no-cache curl unzip
RUN curl -sS https://downloads.1password.com/linux/op/stable/en/linux/amd64/op_linux_amd64_v2.30.0.zip -o op.zip &&     unzip op.zip -d /usr/local/bin/ &&     chmod +x /usr/local/bin/op && rm op.zip

FROM alpine:latest
RUN apk add --no-cache     kubectl     docker-cli     docker-compose     ca-certificates     bash     curl     net-tools     iproute2
COPY --from=builder /usr/local/bin/op /usr/local/bin/op
WORKDIR /root
CMD ["sleep", "infinity"]
