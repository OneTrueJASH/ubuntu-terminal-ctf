#!/bin/bash
# export.sh — saves the image as a single gzipped tar file for transport
# to another machine.
set -euo pipefail
cd "$(dirname "$0")"

IMAGE="${IMAGE:-ubuntu-terminal-ctf:latest}"
OUT="${OUT:-ubuntu-terminal-ctf.tar.gz}"

if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "Image $IMAGE not found. Run ./build.sh first." >&2
    exit 1
fi

echo "Exporting $IMAGE to $OUT..."
docker save "$IMAGE" | gzip > "$OUT"

size=$(du -h "$OUT" | cut -f1)
echo
echo "Exported: $OUT ($size)"
echo
echo "Copy it to the target machine, then there run:"
echo "  gunzip -c $OUT | docker load"
echo "  docker run -d --name ctf -p 2222:22 $IMAGE"
echo "  ssh hacker@localhost -p 2222    # password: hacker"
