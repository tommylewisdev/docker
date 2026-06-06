FROM ubuntu:latest AS layer1
ENV ENV=mylaptop
ADD Volume1/Mytest /tmp
COPY Volume1/Mytest /tmp/Mytest1

RUN du -sk /usr  > /tmp/disk-uage && apt update && cat /tmp/Mytest1 /tmp/disk-uage >> /tmp/allfiles



FROM alpine:latest AS final
COPY --from=layer1 /tmp/allfiles /tmp
