FROM ubuntu:20.04

RUN apt-get update && apt-get install --no-install-recommends -y \
    automake \
    bison \
    ca-certificates \
    flex \
    gcc \
    git \
    libtool \
    make

WORKDIR /tmp

RUN git clone https://github.com/vlm/asn1c.git && \
    cd /tmp/asn1c && \
    test -f configure || autoreconf -iv && \
    ./configure && \
    make && \
#    make check && \
    make install

#Cleanup

RUN rm -Rf /tmp/asn1c && \
    rm -Rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
