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
    ./configure --prefix /srv/asn1c && \
    make && \
#    make check && \
    make install

FROM ubuntu:20.04

COPY --from=0 /srv/asn1c /usr/local/

ENTRYPOINT ["/bin/bash"]
