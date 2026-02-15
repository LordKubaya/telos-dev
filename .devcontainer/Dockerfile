# Force AMD64 platform with Ubuntu 20.04 (matches EOSIO requirements)
FROM --platform=linux/amd64 ubuntu:20.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Fix GPG and certificate issues, then install dependencies
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update --allow-insecure-repositories && \
    apt-get install -y --allow-unauthenticated ca-certificates && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    clang-tidy \
    cmake \
    git \
    libxml2-dev \
    libcurl4-gnutls-dev \
    libtinfo5 \
    libusb-1.0-0 \
    libpq5 \
    python3 \
    python3-pip \
    time \
    nano \
    wget \
    curl \
    jq   \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Install CDT
RUN cd /tmp && \
    wget -q https://github.com/AntelopeIO/cdt/releases/download/v4.1.1/cdt_4.1.1-1_amd64.deb && \
    apt install -y ./cdt_4.1.1-1_amd64.deb && \
    rm -f *.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/archives/*

# Install EOSIO
RUN cd /tmp && \
    wget -q https://github.com/AntelopeIO/spring/releases/download/v1.2.2/antelope-spring_1.2.2_amd64.deb && \
    apt install -y ./antelope-spring_1.2.2_amd64.deb && \
    rm -f *.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/archives/* /var/lib/apt/lists/* /tmp/*

WORKDIR /workspace