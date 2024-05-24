DEVICE_NAME=$(hostname)
docker run --name monero_xmr_miner --restart=always --env-file monero.env \
solumyr/puf-xmr-mining:arm64 -- -p \
${DEVICE_NAME}