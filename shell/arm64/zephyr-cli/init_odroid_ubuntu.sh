#!/bin/sh
sudo apt update && sudo apt install build-essential cmake pkg-config \
libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev \
liblzma-dev libreadline6-dev libexpat1-dev libpgm-dev qttools5-dev-tools \
libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev python3 ccache doxygen graphviz -y

git clone --recursive https://github.com/ZephyrProtocol/zephyr
cd zephyr && git submodule init && git submodule update;
#make release-test
USE_SINGLE_BUILDDIR=1 make release
#make release-static