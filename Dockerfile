FROM ubuntu:23.04

ARG MUSL_VER=1.2.4
ARG MUSL_TARBALL=musl-${MUSL_VER}.tar.gz
ARG MUSL_URL=https://musl.libc.org/releases/${MUSL_TARBALL}
ARG MUSL_PREFIX=/usr/local/musl
ARG RUST_REPO=https://github.com/rust-lang/rust.git
ARG RUSTFLAGS="-C target-feature=-crt-static"

RUN apt update && \
    apt install -y curl python3 pkg-config git build-essential tar

WORKDIR /opt
RUN curl -O ${MUSL_URL} && \
    tar xzf ${MUSL_TARBALL} && \
    cd musl-${MUSL_VER} && \
    ./configure --prefix=${MUSL_PREFIX} && \
    make -j$(nproc) && \
    make install

RUN git clone --recurse-submodules --shallow-submodules --depth 1 ${RUST_REPO}

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ADD config.toml run_tests.sh build_rustc.sh /opt/rust/
ADD musl_app /opt/musl_app

WORKDIR /opt/rust

