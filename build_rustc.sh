#!/bin/bash
RUSTFLAGS="-C target-feature=-crt-static"

RUSTFLAGS_NOT_BOOTSTRAP=${RUSTFLAGS} RUSTFLAGS_BOOTSTRAP=${RUSTFLAGS} ./x build -v library/std