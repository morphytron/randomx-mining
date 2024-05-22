export WORKER_ID=odroid-1
export HOSTNAME=localhost
export CPU_PRIORITY=4
export ALGO=rx/0
export COIN=monero
export THREADS=1
export RANDOMX_MODE=slow
export POOL_URL=xmr-us-east1.nanopool.org:10343
export CPU_MEMORY_POOL=0 #memory is on chip
export USER_ADDRESS=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.amd-desktop-1/dapatiga@gmail.com
exec xmrig_/build/xmrig -t ${THREADS} --coin ${COIN} --a ${ALGO} --tls -o ${POOL_URL} \
--keepalive --cpu-priority ${CPU_PRIORITY} \
--nicehash \
--api-worker-id \
${WORKER_ID} --http-port 8069 --http-host ${HOSTNAME} --opencl
