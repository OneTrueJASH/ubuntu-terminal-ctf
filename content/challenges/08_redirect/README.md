# Challenge 08 — Capture the Output

A common task in the terminal is **saving** what a command prints,
instead of just watching it scroll past. You do that with redirection.

**Goal:** create a file `~/report.txt` that contains:

- Line 1: the output of `whoami` (your username)
- Line 2: the output of `uname -s` (the OS kernel name — should be `Linux`)

Use **`>`** to write the first line (it overwrites the file) and
**`>>`** to append the second line.

## What you need to do

```
whoami > ~/report.txt
uname -s >> ~/report.txt
```

Then verify it looks right:
```
cat ~/report.txt
```

## Submit

Once the file is correct, run:
```
ctf submit 08
```
No flag needed — the checker reads `~/report.txt` and marks the
challenge solved if both lines are right.

## Commands you'll use

`whoami`, `uname`, `>`, `>>`, `cat`
