sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common

sudo apt-get install git
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
sudo apt-get update
sudo apt install ocl-icd-opencl-dev -y
sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
sudo apt-get install automake libtool make gcc -y
sudo apt-get install libjansson-dev -y
sudo apt-get update
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-5

sudo apt-get upgrade -y

sudo update-initramfs -u
sudo apt-get install libopenblas-dev liblapack-dev -y
sudo apt-get install linux-image-generic linux-image-extra-virtual -y
sudo apt-get install linux-source linux-headers-generic -y

sudo apt-get install libglu1-mesa libxi-dev libxmu-dev -y
sudo apt-get — yes install build-essential
sudo apt-get install python-pip python-dev -y
sudo apt-get install python-numpy python-scipy -y
sudo apt-get install libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev -y
sudo apt-get install apt-file -y && apt-file update

sudo apt-get upgrade -y
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update
sudo apt-get install cmake -y
sudo apt-get upgrade -y
