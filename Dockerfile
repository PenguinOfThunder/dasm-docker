FROM debian:stable-slim AS base
ARG DASM_VERSION
ENV DASM_VERSION=${DASM_VERSION}
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* 
RUN mkdir -p /opt/dasm && wget -q -O- https://github.com/dasm-assembler/dasm/releases/download/$DASM_VERSION/dasm-$DASM_VERSION-linux-x64.tar.gz | tar xvzf - -C /opt/dasm
VOLUME /home/dasm
WORKDIR /home/dasm
ENTRYPOINT ["/opt/dasm/dasm"]
CMD ["--help"]

