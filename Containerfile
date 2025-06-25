FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]
ENV SHELL=/bin/bash

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vim \
    nano \
    libwebkit2gtk-4.1-dev \
    build-essential \
    curl \
    wget \
    file \
    libxdo-dev \
    libssl-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    nodejs \
    npm

# clean temp files
RUN apt-get clean

WORKDIR /app

COPY . /app

# install nodejs https://nodejs.org/en/download
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# RUN \. "$HOME/.nvm/nvm.sh"
## Download and install Node.js:
# RUN nvm install 22

# install pnpm https://pnpm.io/installation
# RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
RUN npm install -g pnpm

# install rust https://www.rust-lang.org/learn/get-started
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Install dependencies using pnpm
# RUN pnpm install

# Build the application for production:
ENTRYPOINT ["/bin/bash"]
