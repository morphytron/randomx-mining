#!/bin/sh

export WORKER_ID=amd-desktop-1
export HOSTNAME=localhost
export CPU_PRIORITY=5
export ALGO=rx/0
export COIN=monero
export THREADS=16
export RANDOMX_MODE=fast
export POOL_URL=localhost:3333
export CPU_MEMORY_POOL=32 #memory is on chip
export USER_ADDRESS=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.amd-desktop-1/dapatiga@gmail.com
/root/xmr-mining/shell/amd64/xmrig/xmrig_/build/xmrig -t ${THREADS} --coin ${COIN} --a ${ALGO} --tls -o ${POOL_URL} \
--keepalive --cpu-priority ${CPU_PRIORITY} \
--api-worker-id \
${WORKER_ID} --http-port 8069 --http-host ${HOSTNAME} --opencl &
