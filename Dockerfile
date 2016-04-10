FROM alpine:latest

RUN apk --no-cache add curl jq coreutils

ADD bin /opt/resource
RUN chmod a+rx,go-w /opt/resource/*
