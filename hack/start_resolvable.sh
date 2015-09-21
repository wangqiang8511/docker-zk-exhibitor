#!/usr/bin/env sh

CURRENT_DIR=$(pwd)

docker run -d \
    --hostname resolvable \
    -v /var/run/docker.sock:/tmp/docker.sock \
    -v /etc/resolv.conf:/tmp/resolv.conf \
    mgood/resolvable
