FROM ubuntu:latest
ARG THREADS=2
ARG WORKER_ID=anonymous_worker
ARG USER_ADDRESS=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.$WORKER_ID/dapatiga@gmail.com
ARG HOSTNAME=HOSTNAME_not_set
ARG CPU_PRIORITY=5
ARG CPU_MEMORY_POOL=8
ARG POOL_URL
ARG COIN=zephyr
ARG RANDOMX_MODE=auto
ARG POOL_URL=xmr-us-east1.nanopool.org:10343
ARG ALGO=rx/0
ENV THREADS $THREADS
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

WORKDIR build
# Add all possible configurations
COPY monero_config_part1.json .
COPY monero_config_part2.json .
COPY zephyr_config_part2.json .
COPY zephyr_config_part1.json .
COPY zephyr_address.txt .
COPY monero_address.txt .
RUN touch monero_config.json && touch zephyr_config.json; cat \
monero_config_part1.json >> monero_config.json; cat \
monero_address.txt >> monero_config.json; cat monero_config_part2.json >> \
monero_config.json; cat zephyr_config_part1.json >> zephyr_config.json; cat \
zephyr_address.txt >> zephyr_config.json; cat zephyr_config_part2.json >> \
    zephyr_config.json;


EXPOSE 8069
RUN useradd solumyr --uid=1001
USER solumyr

ENTRYPOINT exec ./xmrig \
-c ${COIN}_config.json \
-u ${USER_ADDRESS} \
-t ${THREADS} --coin \
${COIN} \
-a \
${ALGO} \
--tls -o \
${POOL_URL} \
--cpu-priority ${CPU_PRIORITY} \
--http-enabled --http-no-restricted --http-port 8069 --http-host \
 ${HOSTNAME}
#-c \
#${COIN}_config.json
#--api-worker-id \
#${WORKER_ID}
#-c ../${COIN}_config.json