# Dioxus Builder Docker Image

A pre-configured Docker image for Dioxus development with all necessary dependencies and tools installed.

## What's Included

- **Base OS**: Ubuntu 22.04
- **Rust**: Latest stable toolchain with essential components
- **WebAssembly Targets**: `wasm32-unknown-unknown` and `wasm32-wasip1`
- **System Dependencies**: GTK, WebKit, and other GUI libraries for desktop development
- **Cargo Tools**:
  - `cargo-audit` - Security auditing
  - `cargo-outdated` - Check for outdated dependencies
  - `cargo-watch` - Watch for file changes
  - `cargo-expand` - Macro expansion
  - `cargo-tree` - Dependency tree visualization
  - `cargo-edit` - Edit Cargo.toml dependencies
  - `cargo-tarpaulin` - Code coverage
  - `cargo-deny` - Dependency checking
  - `wasm-pack` - WebAssembly packaging
  - `trunk` - Web application bundler
  - `dx` - Dioxus framework CLI (v0.6.3)

## Usage

### Pull the Image

```bash
docker pull ghcr.io/YOUR_USERNAME/dioxus-builder:main
```

### Run Interactive Shell

```bash
docker run -it --rm ghcr.io/YOUR_USERNAME/dioxus-builder:main
```

### Mount Your Project

```bash
docker run -it --rm \
  -v $(pwd):/app \
  -w /app \
  ghcr.io/YOUR_USERNAME/dioxus-builder:main
```

### Use in GitHub Actions

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: ghcr.io/YOUR_USERNAME/dioxus-builder:main
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v4
      
    - name: Build project
      run: cargo build --release
```

## Building Locally

```bash
docker build -t dioxus-builder .
```

## Available Tags

- `main` - Latest build from main branch
- `v*` - Version tags (e.g., `v1.0.0`)
- `sha-*` - Commit SHA tags

## License

This project is open source and available under the [MIT License](LICENSE). 