# Version 22 of Ubuntu is the only one that works with xmr-stak as of 2026
FROM nvidia/cuda:13.1.0-devel-ubuntu22.04

# Default git repository
ENV GIT_REPOSITORY="https://github.com/fireice-uk/xmr-stak.git"
ENV XMRSTAK_CMAKE_FLAGS="-DXMR-STAK_COMPILE=generic -DHWLOC_ENABLE=ON -DHTTPD_ENABLE=ON -DCUDA_ENABLE=ON -DOpenCL_ENABLE=ON -DCUDA_ARCH=80;86"
ENV CXXFLAGS="-fpermissive"
ENV GPU_FORCE_64BIT_PTR=1
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100
ENV GPU_MAX_WORKGROUP_SIZE=1024
ENV XMRSTAK_NOWAIT=1
# Copy the CUDA type fix file
COPY cuda_type_fix.cu /

RUN useradd --uid=1000 miner
# Install packages
RUN apt-get update \
    && set -x \
    && apt-get install -qq --no-install-recommends git build-essential libmicrohttpd-dev hwloc libhwloc-dev libssl-dev ca-certificates cmake pkg-config ocl-icd-opencl-dev nvidia-opencl-dev opencl-headers ocl-icd-libopencl1 \
    && git clone $GIT_REPOSITORY \
    && cd /xmr-stak \
    && git checkout xmr-stak-rx \
    && mkdir -p xmrstak/backend/nvidia/nvcc_code/ \
    && cp /cuda_type_fix.cu xmrstak/backend/nvidia/nvcc_code/cuda_type_fix.cuh \
    && sed -i '1s/^/#include "cuda_type_fix.cuh"\n/' xmrstak/backend/nvidia/nvcc_code/cuda_extra.cu \
    #&& sed -i '1s/^/#include "cuda_type_fix.cuh"\n/' xmrstak/backend/nvidia/nvcc_code/cuda_cryptonight_gpu.hpp \
    && cmake ${XMRSTAK_CMAKE_FLAGS} . \
    && make \
    && cd - \
    && mv /xmr-stak/bin/* /usr/local/bin/ \
    && apt-get clean -qq
RUN cd /xmr-stak/scripts && chmod +x randomx_booster.sh && ./randomx_booster.sh
RUN rm -rf /xmr-stak
USER miner
RUN sysctl -w vm.nr_hugepages=128
RUN ulimit -l 128
VOLUME /mnt
EXPOSE 8019
WORKDIR /mnt
COPY *.txt .
ENTRYPOINT ["/usr/local/bin/xmr-stak-rx", "--noNVIDIA", "--noAMD", "--noTest", "--currency", "randomx", "-i", "0.0.0.0:8019", "--user", "47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.amd-worker-1/dapatiga@gmail.com", "--tls-url", "xmr-us-east1.nanopool.org:10343"]
