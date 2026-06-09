#!/bin/bash
# build.sh — builds the Ubuntu Terminal CTF docker image locally.
set -euo pipefail
cd "$(dirname "$0")"

IMAGE="${IMAGE:-ubuntu-terminal-ctf:latest}"

echo "Building $IMAGE..."
# linux/amd64 ensures the image works on the typical Linux target machine
# even if you're building from an arm64 Mac.
docker build --platform linux/amd64 -t "$IMAGE" .
echo
echo "Built: $IMAGE"
docker images "$IMAGE"
