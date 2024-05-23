#!/bin/sh

export WORKER_ID=amd-desktop-1
export HOSTNAME=amd-desktop-1
export CPU_PRIORITY=5
export ALGO=rx/0
export COIN=monero
export THREADS=16
export RANDOMX_MODE=fast
export POOL_URL=zeph.us.ekapool.com:15667
export CPU_MEMORY_POOL=32 #memory is on chip
export USER_ADDRESS=ZEPHYR3d6nt5dFCgRDh8A83sK9S7wxtPSFmkggEsV89Y3GWei5rQUphRbiyVbmnKjVW9dk4SNL8D9RC1g2Zhq4EaYjituvxKdLK4X
exec /root/xmr-mining/shell/amd64/xmrig/xmrig_/build/xmrig -t ${THREADS} --coin
${COIN} --a ${ALGO} --tls -o ${POOL_URL} \
--keepalive --cpu-priority ${CPU_PRIORITY} \
--api-worker-id \
${WORKER_ID} --http-port 8069 --http-host ${HOSTNAME} --opencl -p ${WORKER_ID}
