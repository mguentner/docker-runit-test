# DOCKER-VERSION 1.3.1
# VERSION 0.1
FROM debian:jessie
MAINTAINER Maximilian Güntner <maximilian.guentner@gmail.com>

ENV HELLO_TEXT "Hello Reddit"

# runit depends on /etc/inittab which is not present in debian:jessie
RUN touch /etc/inittab
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q runit

RUN mkdir -p /etc/service/your_app/
COPY ./your_app/run /etc/service/your_app/run

ENTRYPOINT ["runsvdir",  "-P", "/etc/service"]
