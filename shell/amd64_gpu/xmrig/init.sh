apt-get update
apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
git clone https://github.com/xmrig/xmrig.git
mkdir build
cd build
cmake ..;
make -j$(nproc)
cp ../config.json .
