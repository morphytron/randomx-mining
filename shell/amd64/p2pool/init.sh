sysctl vm.nr_hugepages=3072
git clone --recursive https://github.com/SChernykh/p2pool p2pool_
cd p2pool_
mkdir build & cd build
cmake ..
make -j$(nproc)
