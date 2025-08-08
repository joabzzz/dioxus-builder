# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables for non-interactive apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Essential build tools
    build-essential \
    curl \
    ca-certificates \
    pkg-config \
    # SSL and crypto libraries
    libssl-dev \
    # GTK and GUI libraries for desktop apps
    libgtk-3-dev \
    libwebkit2gtk-4.1-dev \
    libappindicator3-dev \
    librsvg2-dev \
    libglib2.0-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libatk1.0-dev \
    libgdk-pixbuf2.0-dev \
    libxdo-dev \
    # Additional system libraries that might be needed
    libdbus-1-dev \
    libx11-dev \
    libxrandr-dev \
    libxss-dev \
    libxtst-dev \
    libxcb1-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev \
    # Development tools
    git \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Install Rustup and the stable Rust toolchain with essential components
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable && \
    . "$HOME/.cargo/env" && \
    rustup default stable && \
    rustup component add rustfmt clippy rust-src rust-analysis && \
    rustup target add wasm32-unknown-unknown && \
    rustup target add wasm32-wasip1

# Set environment variables for Rust
ENV PATH="/root/.cargo/bin:${PATH}"
ENV CARGO_HOME="/root/.cargo"
ENV RUSTUP_HOME="/root/.rustup"

# Install essential cargo tools for development
RUN cargo install cargo-audit && \
    cargo install cargo-outdated && \
    cargo install cargo-watch && \
    cargo install cargo-expand && \
    cargo install cargo-tree && \
    cargo install cargo-edit && \
    cargo install cargo-tarpaulin && \
    cargo install cargo-deny && \
    cargo install wasm-pack && \
    cargo install trunk && \
    cargo install dioxus-cli --version 0.6.3

# Set working directory
WORKDIR /app

# Optional: Copy your application source code (to be done by the user)
# COPY . .

# Optional: Build your application (to be done by the user)
# RUN cargo build --release --features desktop

CMD ["bash"]
