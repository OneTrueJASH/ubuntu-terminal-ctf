#!/bin/bash
# run.sh — runs the CTF container locally for testing or use.
set -euo pipefail

IMAGE="${IMAGE:-ubuntu-terminal-ctf:latest}"
NAME="${NAME:-ctf}"
PORT="${PORT:-2222}"

# Stop and remove any existing container with the same name.
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
    echo "Removing existing container '$NAME'..."
    docker rm -f "$NAME" >/dev/null
fi

echo "Starting '$NAME' from $IMAGE on host port $PORT..."
docker run -d \
    --name "$NAME" \
    --restart unless-stopped \
    -p "$PORT:22" \
    "$IMAGE"

# Give sshd a couple seconds to come up.
sleep 2

echo
echo "Container is running."
echo
echo "  SSH in with:    ssh hacker@localhost -p $PORT"
echo "  Password:       hacker"
echo "  Stop with:      docker stop $NAME"
echo "  Restart with:   docker start $NAME"
echo "  Wipe with:      docker rm -f $NAME"
echo
echo "  ⚠ First time you SSH in, accept the host key fingerprint."
