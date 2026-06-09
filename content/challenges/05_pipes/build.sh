#!/bin/bash
# Build a manifesto where RESISTANCE appears exactly 42 times.
set -euo pipefail
HOME_DIR="$1"
F="$HOME_DIR/challenges/05_pipes/manifesto.txt"

mkdir -p "$(dirname "$F")"

filler=(
  "The system is brittle but the will is strong."
  "Every command is a small act of choice."
  "We who type, we who tab-complete, we endure."
  "There is wisdom hidden inside man pages."
  "A shell prompt is a window to power."
  "Even the smallest script changes the world."
  "Some files are forgotten. Others are found."
  "Permissions are promises kept by the kernel."
)

{
  for i in $(seq 1 200); do
    if (( i % 5 == 0 && i <= 210 )); then
      echo "RESISTANCE is built one keystroke at a time. ($i)"
    else
      echo "${filler[$RANDOM % ${#filler[@]}]} ($i)"
    fi
  done
} > "$F"

# Verify there are exactly 42 occurrences. If not, adjust.
count=$(grep -c RESISTANCE "$F" || true)
if [ "$count" -ne 42 ]; then
    # Trim or pad to exactly 42 matching lines.
    if [ "$count" -gt 42 ]; then
        # Replace excess RESISTANCE lines with filler.
        excess=$(( count - 42 ))
        awk -v ex="$excess" '
            /RESISTANCE/ && r++ <= ex { print "Quiet observation. (filler)"; next }
            { print }
        ' "$F" > "$F.tmp" && mv "$F.tmp" "$F"
    else
        # Append more RESISTANCE lines.
        for i in $(seq 1 $((42 - count))); do
            echo "RESISTANCE persists, line $i appended." >> "$F"
        done
    fi
fi

# Final assertion at build time
final=$(grep -c RESISTANCE "$F")
[ "$final" -eq 42 ] || { echo "BUG: manifesto has $final RESISTANCE lines, want 42" >&2; exit 1; }
