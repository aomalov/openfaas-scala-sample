FROM openjdk:8u121-jdk-alpine

ENV SBT_VERSION=1.2.7

# do all in one step
RUN apk add --no-cache bash curl openrc git && \
curl -sL "http://piccolo.link/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
chmod 0755 /usr/local/bin/sbt && \
apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN mkdir -p /home/init

RUN cd /home/init && \
touch build.sbt && \
sbt reload exit