DEVICE_NAME=$(hostname)
docker run --name zephyr_xmr_miner --env-file zephyr.env solumyr/puf-xmr-mining:arm64 -- -p \
${DEVICE_NAME}
