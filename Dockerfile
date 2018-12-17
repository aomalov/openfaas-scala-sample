FROM aomalov/alpine-sbt:latest as builder

WORKDIR /home/app

COPY . /home/app/

RUN sbt clean test assembly

FROM openjdk:8u121-jdk-alpine as ship
RUN apk --no-cache add curl \
    && echo "Pulling watchdog binary from Github." \
    && curl -sSL https://github.com/openfaas-incubator/of-watchdog/releases/download/0.4.2/of-watchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk del curl

RUN addgroup -S app && adduser -S -g app app
WORKDIR /home/app
COPY --from=builder /home/app/target/scala-2.12/*.jar ./

RUN chown -R app /home/app
USER app

ENV CLASSPATH="/home/app/*"
ENV fprocess="java io.openfaas.function.TestFunction2"

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]