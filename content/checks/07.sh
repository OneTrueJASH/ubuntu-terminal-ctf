#!/bin/bash
# Challenge 07: verify ~/vault/treasure.txt exists and the submitted flag matches.
set -u
flag="${1:-}"

if [ ! -f "$HOME/vault/treasure.txt" ]; then
    echo "  ✗ I don't see ~/vault/treasure.txt yet."
    echo "    Did you make the vault directory and move the file there?"
    exit 1
fi

if [ -f "$HOME/challenges/07_move/loot.txt" ]; then
    echo "  ✗ The original loot.txt is still in challenges/07_move/."
    echo "    Use 'mv' (move), not 'cp' (copy) — the original should be gone."
    exit 1
fi

if [ -z "$flag" ]; then
    echo "  ✓ File moved correctly! Now submit the flag:"
    echo "    ctf submit 07 FLAG{...}"
    echo "    (read it with: cat ~/vault/treasure.txt)"
    exit 1
fi

got=$(printf %s "$flag" | sha256sum | awk '{print $1}')
expected=$(awk '$1 == "07" { print $2 }' /opt/ctf/flags.sha256)
if [ "$got" = "$expected" ]; then
    exit 0
else
    echo "  ✗ Flag doesn't match. Re-read ~/vault/treasure.txt."
    exit 1
fi
