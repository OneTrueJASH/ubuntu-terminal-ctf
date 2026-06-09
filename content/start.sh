#!/bin/bash
# Container entrypoint. Starts background services, then sshd in the foreground.

set -e

# Start a tiny HTTP server on :8080 for challenge 10 (network/curl).
# Runs as nobody, serving /opt/ctf/web.
( cd /opt/ctf/web && su -s /bin/sh nobody -c "python3 -m http.server 8080" \
    > /var/log/ctf-web.log 2>&1 ) &

# Start the "decoy_daemon" for challenge 09 (processes). It runs as the hacker
# user so the student can kill it without sudo. The launcher script is named
# /opt/ctf/bin/launch_bg (not decoy_daemon) on purpose: pkill -f decoy_daemon
# should match ONLY the actual decoy, not the su/launcher chain that spawned
# it. The decoy itself shows up as "decoy_daemon" thanks to exec -a inside
# the launcher.
su - hacker -c '/opt/ctf/bin/launch_bg' &

# Start a background appender for challenge that uses tail -f if you add one.
# (Currently no such challenge — stub left intentionally blank.)

# Bring up sshd in the foreground so the container stays alive.
exec /usr/sbin/sshd -D -e
