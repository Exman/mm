FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://download-endpoint.minergate.com/xfast-ubuntu-cli \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "oleg.ivanovych@hotmail.com", "-xmr"]
