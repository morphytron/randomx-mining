FROM ubuntu:latest
RUN apt-get update
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN git clone https://github.com/xmrig/xmrig.git
WORKDIR xmrig
RUN mkdir build && cd build; cmake ..; make -j$(nproc)
WORKDIR build
COPY config.json ./
ENV WORKER_ID=$WORKER_ID
EXPOSE 8069
ENTRYPOINT ["./xmrig",  "--api-worker-id", "$WORKER_ID"]
