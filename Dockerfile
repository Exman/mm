FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        ocl-icd-libopencl1 \
        nvidia-cuda-dev \
    && rm -r /var/lib/apt/lists/*
RUN apt --fix-broken install

RUN wget -q --content-disposition https://download.minergate.com/xfast-ubuntu-cli/1.6 \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
RUN minergate-cli --user oleg.ivanovych@hotmail.com --xmr 8
