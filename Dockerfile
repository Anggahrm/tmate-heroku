FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    tmate \
    openssh-client \
    wget \
    curl \
    git \
    vim \
    nano \
    htop \
    net-tools \
    build-essential \
    python3 \
    python3-pip \
    unzip \
    zip \
    software-properties-common \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN node --version && \
    npm --version && \
    yarn --version

CMD ["tmate", "-F"]
