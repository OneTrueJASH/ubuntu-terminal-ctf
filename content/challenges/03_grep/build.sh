#!/bin/bash
# Build a big access log with one INTRUDER line containing the flag.
set -euo pipefail
HOME_DIR="$1"
LOG="$HOME_DIR/challenges/03_grep/access.log"

paths=(/ /login /api/users /api/orders /static/main.css /favicon.ico /robots.txt /about /contact /pricing)
methods=(GET POST GET GET GET)
codes=(200 200 200 304 404 200 200 500 200)

mkdir -p "$(dirname "$LOG")"

{
    for i in $(seq 1 4999); do
        ip="10.0.$(( RANDOM % 255 )).$(( RANDOM % 255 ))"
        m=${methods[$RANDOM % ${#methods[@]}]}
        p=${paths[$RANDOM % ${#paths[@]}]}
        c=${codes[$RANDOM % ${#codes[@]}]}
        echo "$ip - - [09/Jun/2026:12:00:$i] \"$m $p HTTP/1.1\" $c"
    done

    # Insert the INTRUDER line at a random spot in the middle.
    echo "203.0.113.99 - - [09/Jun/2026:13:47:22] \"GET /admin INTRUDER HTTP/1.1\" 200 FLAG{gr3p_f0r_g0ld}"
} | shuf > "$LOG"
