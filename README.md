# Running Rust x86-unknown-linux-musl library/std tests on a x86-unknown-linux-gnu host

This repository contains a Dockerfile to demonstrate a potential bug while running Rust library/std unit tests targeting x86-unknown-linux-musl on a x86-unknown-linux-gnu host which have musl libc installed.

## How to reproduce this bug

I have included all necessary steps in this `Dockerfile`, and `config.toml` is the configuration I used when running tests. So just build a image using this `Dockerfile`(this build would fail, you could use `docker image prune` and `docker container prune` to prune dangling objects).

Clone this repository, then run `docker build -t issue:latest .` in it.