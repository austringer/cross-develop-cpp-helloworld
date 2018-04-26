FROM ubuntu:18.04 AS base

ARG DEBIAN_FRONTEND=noninteractive
RUN \
# replace wiht a mirroring repository in China
  sed -i -e "s@http://archive.ubuntu.com/ubuntu@http://mirrors.tuna.tsinghua.edu.cn/ubuntu@" /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    apt-utils && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
# network utilities
    ca-certificates gnupg dirmngr \
    curl wget ssh && \
  apt-get clean && rm -rf /var/lib/apt/lists/*


FROM base AS toolchain

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
# tools
    zip unzip bzip2 xz-utils \
    patch \
    procps \
    git git-lfs \
    python python3 \
    libc-dev dpkg-dev \
# configuration and compile
    autoconf automake \
    make cmake \
    ccache distcc \
    g++ g++-multilib gdb gdbserver \
    clang clang-tools lldb lld llvm && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ENV \
  CC="ccache /usr/bin/gcc" \
  CXX="ccache /usr/bin/g++" \
  CCACHE_DIR="/ccache"
