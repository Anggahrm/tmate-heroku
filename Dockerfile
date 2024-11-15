FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ENV TMATE_API_KEY="tmk-914Hzkcw1fm57fD6wJTmyFUzB0"
ENV TMATE_SESSION_NAME="zumyfree"

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

RUN echo "set tmate-api-key \"$TMATE_API_KEY\"" >> /etc/tmate.conf && \
    echo "set tmate-session-name \"$TMATE_SESSION_NAME\"" >> /etc/tmate.conf

WORKDIR /app

RUN node --version && \
    npm --version && \
    yarn --version && \
    python3 --version
CMD ["tmate", "-k", "$TMATE_API_KEY", "-n", "$TMATE_SESSION_NAME"]
