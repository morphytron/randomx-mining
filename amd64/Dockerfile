FROM ubuntu:jammy
USER root
RUN apt-get update; apt-get install software-properties-common apt-utils -y
RUN apt-get update;\
            apt-get upgrade -y;\
            apt-get install git -y;\
            add-apt-repository main -y;\
            add-apt-repository universe -y;\
            add-apt-repository restricted -y;\
            add-apt-repository multiverse -y;\
            apt-get update;\
            apt-get install ocl-icd-opencl-dev -y;\
            apt-get install libmicrohttpd-dev libssl-dev cmake \
    build-essential -y;\
            apt-get install automake libtool make gcc -y;\
            apt-get install libjansson-dev -y;\
            apt-get update;\
            add-apt-repository ppa:ubuntu-toolchain-r/test -y;\
            apt-get update;\
            apt-get install g++-5 -y;\
            apt-get upgrade -y;\
            update-initramfs -u;\
            apt-get install libopenblas-dev liblapack-dev -y;\
            apt-get install linux-image-generic \
    linux-image-extra-virtual -y;\
            apt-get install linux-source linux-headers-generic -y;\
            apt-get install libglu1-mesa libxi-dev libxmu-dev -y;\
            apt-get install build-essential -y;\
            apt-get install python-pip python-dev -y;\
            apt-get install python-numpy python-scipy -y;\
            apt-get install libglu1-mesa libxi-dev libxmu-dev \
    libglu1-mesa-dev -y;\
            apt-get install apt-file -y; apt-file update;\
            add-apt-repository ppa:george-edison55/cmake-3.x -y;\
            apt-get update;\
            apt-get install cmake -y;\
            apt-get upgrade -y;
RUN apt-get install libhwloc-dev -y
WORKDIR miner
RUN git clone https://github.com/fireice-uk/xmr-stak.git; cd \
    xmr-stak/xmrstak; rm donate-level.hpp;
COPY ./donate-level.hpp ./xmr-stak/xmrstak/donate-level.hpp
ENV DCMAKE_CC_COMPILER=/usr/bin/gcc5
RUN cd xmr-stak; cmake -DCUDA_ENABLE=OFF \
    -DOpenCL_ENABLE=OFF -DCMAKE_CXX_COMPILER=/usr/bin/g++
RUN cd xmr-stak; make install; cd bin; chmod +x \
    xmr-stak; rm config.txt;
COPY ../config.txt ./xmr-stak-cpu/bin/config.txt
ENTRYPOINT ["xmr-stak/bin/xmr-stak config.txt"]

