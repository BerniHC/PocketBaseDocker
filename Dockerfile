# syntax=docker/dockerfile:1

FROM alpine:latest

ARG POCKETBASE_VERSION=0.7.6

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip /app/pocketbase/pocketbase.zip
RUN unzip /app/pocketbase/pocketbase.zip -d /app/pocketbase
RUN chmod +x /app/pocketbase/pocketbase
RUN rm /app/pocketbase/pocketbase.zip

EXPOSE 80

CMD [ "/app/pocketbase/pocketbase", "serve", "--http", "0.0.0.0:80" ]
