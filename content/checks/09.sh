#!/bin/bash
# Challenge 09: verify decoy_daemon is no longer running.
# State-based: no flag string to leak.
set -u

if pgrep -f decoy_daemon > /dev/null; then
    pid=$(pgrep -f decoy_daemon | head -1)
    echo "  ✗ decoy_daemon is still running (PID $pid)."
    echo "    Kill it with:  kill $pid"
    echo "    Or:           pkill -f decoy_daemon"
    exit 1
fi

exit 0
