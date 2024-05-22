pacman -S base-devel cmake  extra/hwloc --noconfirm
git clone https://github.com/xmrig/xmrig.git xmrig_
cd xmrig_
mkdir build
cd build
cmake ..;
make -j$(nproc)
cp ../../../config.json . 
