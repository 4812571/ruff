# Build Stage
FROM ghcr.io/evanrichter/cargo-fuzz:latest AS builder

## Add source code to the build stage.
ADD . /src
WORKDIR /src

# Build the application.
RUN cargo build --release

# Package Stage
FROM ubuntu:latest
COPY --from=builder /src/target/release/ruff /ruff