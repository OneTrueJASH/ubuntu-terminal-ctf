# Challenge 05 — Count the Hits

Inside `~/challenges/05_pipes/manifesto.txt` is a long manifesto. The
word **`RESISTANCE`** appears in it a specific number of times.

**Goal:** count exactly how many times `RESISTANCE` appears, then
submit `FLAG{N}` where `N` is your count.

## What you need to do

There are two clean ways to solve this:

- The shortest:
  ```
  grep -c RESISTANCE <file>
  ```
  `-c` tells grep to **c**ount matching lines instead of printing them.

- The "pipe" way (more useful to learn — it composes any commands):
  ```
  grep RESISTANCE <file> | wc -l
  ```
  The `|` (pipe) sends grep's output into `wc -l`, which counts lines.

Watch out: `grep` counts **lines** that match, not total occurrences.
In this file every line contains the word at most once, so both ways
agree.

## Submit

```
ctf submit 05 FLAG{N}
```
(replace `N` with your count)

## Commands you'll use

`grep`, `wc`, `|` (pipe)
