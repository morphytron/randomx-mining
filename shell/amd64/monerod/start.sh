#!/bin/sh

/root/xmr-mining/shell/amd64/monerod/monero_/monero-x86_64-linux-gnu-v0.18.3.3/monerod --detach --zmq-pub tcp://127.0.0.1:18083 --out-peers 32 --in-peers 64 --add-priority-node=p2pmd.xmrvsbeast.com:18080 --add-priority-node=nodes.hashvault.pro:18080 --disable-dns-checkpoints --enable-dns-blocklist --prune-blockchain  > logs.txt 
