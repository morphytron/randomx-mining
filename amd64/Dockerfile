FROM nvidia/opencl:devel-ubuntu16.04 AS BUILDER
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update; apt-get install software-properties-common apt-utils -y
RUN apt-get upgrade -y;\
            apt-get install git -y;\
            add-apt-repository main -y;\
            add-apt-repository universe -y;\
            add-apt-repository restricted -y;\
            add-apt-repository multiverse -y;\
            apt-get update;\
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
            apt-get install python-pip python-dev -y;\
            apt-get install python-numpy python-scipy -y;\
            apt-get install libglu1-mesa libxi-dev libxmu-dev \
    libglu1-mesa-dev -y;\
            apt-get install apt-file -y; apt-file update;\
            add-apt-repository ppa:george-edison55/cmake-3.x -y;\
            apt-get update;\
            apt-get install cmake -y;\
            apt-get upgrade -y;
RUN apt-get install hwloc libhwloc-dev -y;
RUN useradd --uid=1000 miner
WORKDIR miner
RUN git clone https://github.com/fireice-uk/xmr-stak.git; cd \
    xmr-stak/xmrstak; rm donate-level.hpp;
COPY ./donate-level.hpp ./xmr-stak/xmrstak/donate-level.hpp
ENV DCMAKE_CC_COMPILER=/usr/bin/gcc5
RUN cd xmr-stak; cmake  -DCUDA_ENABLE=OFF \
    -DOpenCL_ENABLE=ON -DCMAKE_CXX_COMPILER=/usr/bin/g++
RUN cd xmr-stak; make install;
COPY config.txt ./xmr-stak/bin/config.txt
#CMD ls xmr-stak/bin -a
ENV XMRSTAK_NOWAIT=1
EXPOSE 8069
SHELL [ "/bin/bash", "-c" ]
ENTRYPOINT ["./xmr-stak/bin/xmr-stak", "-c", "config.txt", "-i", "8069", "--user","47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.amd-desktop-1/dapatiga@gmail.com", "--tls-url", "xmr-us-east1.nanopool.org:10343"]
#chmod +x \
 #   xmr-stak; 
#COPY config.txt ./xmr-stak/bin/config.txt
#ENTRYPOINT ["xmr-stak/bin/xmr-stak config.txt"]


#FROM nvidia/opencl:runtime-ubuntu18.04
#RUN useradd --uid=1000 miner
#RUN apt-get update;
#RUN apt-get install libssl1.0.0 libssl-dev libmicrohttpd-dev -y
#RUN cd /lib/x86_64-linux-gnu;\
#ln -s libssl.so.1.0.0 libssl.so.10;\
#ln -s libcrypto.so.1.0.0 libcrypto.so.10
#USER miner
#WORKDIR miner