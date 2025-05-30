# Dockerfile to containerize fileSystem
FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc build-essential && \
    apt-get clean

WORKDIR /app
COPY . /app

RUN gcc -o fileSystem fileSystem.c

CMD ["./fileSystem"]
