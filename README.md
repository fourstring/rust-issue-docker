# Running Rust x86-unknown-linux-musl library/std tests on a x86-unknown-linux-gnu host

This repository contains a Dockerfile to demonstrate a potential bug while running Rust library/std unit tests targeting x86-unknown-linux-musl on a x86-unknown-linux-gnu host which have musl libc installed.

## How to reproduce this bug

I have included all necessary steps to reproduce a testing environment in this `Dockerfile`, and `config.toml` is the configuration I used when running tests. So just build a image using this `Dockerfile` and running tests in it.

Clone this repository, then run `docker build -t issue:latest .`. After that:

```bash
docker run -it --rm issue:latest /bin/bash
# in shell of the container
./run_tests.sh
```

## How to build a running app targeting x86_64-unknown-linux-musl on this x86_64-unknown-linux-gnu host

I have included a running example in `musl_app` directory. If you want to investigate how the stage 1 compiler built with `config.toml` compiles a running executable, just switch to this directory, and run it with cargo(you have to build stage 1 compiler, `build_rustc.sh` would do it for you):

```bash
docker run -it --rm issue:latest /bin/bash
# in shell of the container
cd /opt/rust
./build_rustc.sh
cd /opt/musl_app
cargo run -v --target x86_64-unknown-linux-musl
```