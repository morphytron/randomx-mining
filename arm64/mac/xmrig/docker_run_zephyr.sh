DEVICE_NAME=$(hostname)
docker run --name zephyr_xmr_miner --restart=always --env-file zephyr.env \
solumyr/puf-xmr-mining:arm64 -- -p daniels_mining_rig
