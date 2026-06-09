#!/bin/bash
# Challenge 08: verify ~/report.txt has whoami on line 1 and the kernel name on line 2.
# State-based: no flag string to leak.
set -u

f="$HOME/report.txt"

if [ ! -f "$f" ]; then
    echo "  ✗ ~/report.txt doesn't exist yet. Use > to create it."
    exit 1
fi

line1=$(sed -n '1p' "$f")
line2=$(sed -n '2p' "$f")
line3=$(sed -n '3p' "$f")

if [ "$line1" != "$(whoami)" ]; then
    echo "  ✗ Line 1 should be your username (output of 'whoami'), got: '$line1'"
    echo "    Try:  whoami > ~/report.txt"
    exit 1
fi

if [ "$line2" != "Linux" ]; then
    echo "  ✗ Line 2 should be 'Linux' (output of 'uname -s'), got: '$line2'"
    echo "    Try:  uname -s >> ~/report.txt"
    echo "    (note the >> — single > would overwrite line 1!)"
    exit 1
fi

if [ -n "$line3" ]; then
    echo "  ✗ The file has extra lines. Reset with:  whoami > ~/report.txt"
    echo "    Then:  uname -s >> ~/report.txt"
    exit 1
fi

exit 0
