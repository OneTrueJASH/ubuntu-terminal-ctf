#!/bin/bash
# Runs ONCE at image build time. Lays down challenge content into /home/hacker
# and wires up the shell environment.

set -euo pipefail

HOME_DIR=/home/hacker

# --- Shell environment -------------------------------------------------------
cat /opt/ctf/bashrc-additions >> "$HOME_DIR/.bashrc"
install -o root -g root -m 0644 /opt/ctf/motd /etc/motd

# --- Tooling on PATH ---------------------------------------------------------
# Symlink the ctf command into /usr/local/bin so it's always on $PATH.
ln -sf /opt/ctf/bin/ctf      /usr/local/bin/ctf
ln -sf /opt/ctf/bin/submit   /usr/local/bin/submit
ln -sf /opt/ctf/bin/progress /usr/local/bin/progress

# --- Lay down challenges -----------------------------------------------------
mkdir -p "$HOME_DIR/challenges"
cp -r /opt/ctf/challenges/. "$HOME_DIR/challenges/"

# --- Per-challenge build steps ----------------------------------------------
# Some challenges need generated content (large random haystacks, log files
# with one INTRUDER line, etc). Run each builder if present.
for builder in /opt/ctf/challenges/*/build.sh; do
    [ -x "$builder" ] || chmod +x "$builder"
    "$builder" "$HOME_DIR"
done

# Remove the build.sh files from the student's view — they reveal answers.
find "$HOME_DIR/challenges" -name build.sh -delete

# Challenge 06's reveal.sh must NOT be executable — that's the puzzle.
chmod 0644 "$HOME_DIR/challenges/06_chmod/reveal.sh"

# --- Initial progress file ---------------------------------------------------
mkdir -p "$HOME_DIR/.ctf"
: > "$HOME_DIR/.ctf/progress"

# --- Ownership ---------------------------------------------------------------
chown -R hacker:hacker "$HOME_DIR"

# --- Welcome README in $HOME ------------------------------------------------
install -o hacker -g hacker -m 0644 /opt/ctf/welcome.md "$HOME_DIR/README.md"

echo "[install] CTF environment ready."
