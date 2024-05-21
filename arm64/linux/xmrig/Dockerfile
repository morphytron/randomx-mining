FROM ubuntu:latest
ARG THREADS=2
ARG WORKER_ID=anonymous_worker
ARG USER_ADDRESS=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.$WORKER_ID/dapatiga@gmail.com
ARG HOSTNAME=HOSTNAME_not_set
ARG CPU_PRIORITY=5
ARG CPU_MEMORY_POOL=8
ARG POOL_URL
ARG COIN=monero
ARG RANDOMX_MODE=auto
ARG POOL_URL=xmr-us-east1.nanopool.org:10343
ARG ALGO=rx/0
ENV CPU_PRIORITY $CPU_PRIORITY
ENV CPU_MEMORY_POOL $CPU_MEMORY_POOL #16MB cache or the total cpu cache.
 #If using small IoT devices, set to 0
ENV RANDOMX_MODE $RANDOMX_MODE
ENV WORKER_ID $WORKER_ID
ENV USER_ADDRESS $USER_ADDRESS
ENV HOSTNAME $HOSTNAME
ENV POOL_URL $POOL_URL
ENV COIN $COIN
ENV ALGO $ALGO
RUN apt-get update
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN git clone https://github.com/xmrig/xmrig.git
WORKDIR xmrig
RUN mkdir build && cd build; cmake ..; make -j$(nproc)
COPY config_part1.json .
COPY config_part2.json .
RUN touch config.json; cat config_part1.json >> config.json; echo \
${USER_ADDRESS} >> config.json; cat config_part2.json >> config.json;
RUN cp config.json ./build/config.json
RUN apt-get install kmod -y
RUN scripts/randomx_boost.sh
RUN scripts/enable_1gb_pages.sh
WORKDIR build
EXPOSE 8069
RUN useradd solumyr --uid=1001
USER solumyr
ENTRYPOINT exec ./xmrig -t ${THREADS} --coin ${COIN} --algo ${ALGO} --tls -o \
${POOL_URL} \
--keepalive --cpu-priority ${CPU_PRIORITY} \
--nicehash --randomx-1gb-pages  \
--api-worker-id \
${WORKER_ID} --http-port 8069 --http-host ${HOSTNAME}
