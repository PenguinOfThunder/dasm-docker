# Dockerfile for cloning and building dasm from source
FROM debian:stable AS build
ARG DASM_BRANCH=master
ENV DASM_BRANCH=${DASM_BRANCH}
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git build-essential gcc make \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && adduser dasm
USER dasm
WORKDIR /src
RUN git clone -b $DASM_BRANCH -- https://github.com/dasm-assembler/dasm.git /src/dasm \
  && cd /src/dasm && make && ls -l

FROM debian:stable-slim AS run
WORKDIR /dasm
COPY --from=build /src/dasm/bin /dasm/
COPY --from=build /src/dasm/machines /dasm/machines/
ENTRYPOINT ["/dasm/dasm"]

