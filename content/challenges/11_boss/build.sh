#!/bin/bash
# Build the boss-level content: a haystack of dossiers (one with FRAGMENT2)
# and a long archive file (with FRAGMENT3 on a specific line).
set -euo pipefail
HOME_DIR="$1"
BOSS="$HOME_DIR/challenges/11_boss"

# --- Leg 2: dossiers/ -- many decoy files, one with FRAGMENT2: ---------------
DOSS="$BOSS/dossiers"
mkdir -p "$DOSS"

surnames=(martinez kim okafor nguyen patel ivanova bachmann ostrowski
          delgado nakamura petrov solomon yamashiro hassan oconnor
          weisman vargas chen schmitt richards)

decoy_lines=(
  "Last seen at warehouse 7 on Tuesday."
  "No known associates in the western sector."
  "Driving a beige sedan, license starts with X4."
  "Routinely meets contact at the noodle stand."
  "Suspected of leaking the Q3 schematics."
  "Background: dropped out of polytechnic, 2019."
  "Carries a yellow notebook everywhere."
  "Speaks four languages including Tagalog."
  "Has a sister in the local PD — be careful."
  "Sleeps four hours a night, drinks black coffee."
)

# Generate 20 dossiers, each with 12 lines of plausible decoy text.
for name in "${surnames[@]}"; do
    f="$DOSS/dossier_${name}.txt"
    {
      echo "== Dossier: ${name^} =="
      for i in $(seq 1 12); do
        echo "${decoy_lines[$RANDOM % ${#decoy_lines[@]}]}"
      done
    } > "$f"
done

# Plant FRAGMENT2 in exactly ONE dossier, on a random line in the middle.
target_dossier="$DOSS/dossier_okafor.txt"
awk 'NR == 6 { print "FRAGMENT2: 0f" } { print }' "$target_dossier" > "$target_dossier.tmp"
mv "$target_dossier.tmp" "$target_dossier"

# --- Leg 3: archive.txt -- 5000 lines, FRAGMENT3 on line 1337 ----------------
ARCH="$BOSS/archive.txt"

intel_lines=(
  "TIMESTAMP 2026-01-04 10:14:22  EVENT  login   USER alpha   STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:23  EVENT  query   USER alpha   STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:24  EVENT  logout  USER beta    STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:25  EVENT  login   USER gamma   STATUS fail"
  "TIMESTAMP 2026-01-04 10:14:26  EVENT  retry   USER gamma   STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:27  EVENT  upload  USER alpha   STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:28  EVENT  query   USER delta   STATUS ok"
  "TIMESTAMP 2026-01-04 10:14:29  EVENT  logout  USER alpha   STATUS ok"
)

{
  for i in $(seq 1 5000); do
    if [ "$i" -eq 1337 ]; then
      echo "FRAGMENT3: term1nal"
    else
      echo "${intel_lines[$RANDOM % ${#intel_lines[@]}]}  SEQ=$i"
    fi
  done
} > "$ARCH"

# Sanity assertions at build time
grep -q "^FRAGMENT2: 0f$" "$DOSS/dossier_okafor.txt" || { echo "BUG: FRAGMENT2 missing" >&2; exit 1; }
[ "$(sed -n '1337p' "$ARCH")" = "FRAGMENT3: term1nal" ] || { echo "BUG: FRAGMENT3 not on line 1337" >&2; exit 1; }
