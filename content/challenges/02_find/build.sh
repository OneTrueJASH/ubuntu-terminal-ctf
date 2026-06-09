#!/bin/bash
# Build a haystack of ~300 noise files in a nested tree, and hide one .key file.
set -euo pipefail
HOME_DIR="$1"
HAY="$HOME_DIR/challenges/02_find/haystack"
mkdir -p "$HAY"

# Make 12 subdirs each with 2 sub-subdirs and 10 noise files.
for d in $(seq -f 'dir_%02g' 1 12); do
    for s in a b; do
        path="$HAY/$d/sub_$s"
        mkdir -p "$path"
        for i in $(seq 1 10); do
            : > "$path/note_${i}.txt"
            : > "$path/data_${i}.log"
        done
    done
done

# Hide ONE .key file deep in the tree.
target="$HAY/dir_07/sub_b/backdoor_admin.key"
cat > "$target" <<'EOF'
== Recovered key file ==

Notes from the previous admin:
  - rotate this monthly (I didn't)
  - the flag is below

FLAG{n33dle_h4ystack}
EOF
