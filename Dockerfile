FROM ubuntu:22.04

WORKDIR /workspace

# Install tooling dependencies
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends ca-certificates \
        git make clang 

RUN git clone https://git.savannah.gnu.org/git/gforth

WORKDIR /workspace/gforth

RUN ./install-deps.sh && \
    ./autogen.sh && \
    ./configure

RUN make && make install

WORKDIR /code
# 
COPY bin .
# 
CMD "./run.sh"