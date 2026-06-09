# Challenge 06 — Unlock the Script

There's a script at `~/challenges/06_chmod/reveal.sh` that, when run,
prints the flag. The problem: it doesn't have execute permission, so
the shell refuses to run it.

**Goal:** make the script executable, then run it.

## What you need to do

1. Try to run it first (it'll fail):
   ```
   ./reveal.sh
   ```
2. Check the file's permissions:
   ```
   ls -l reveal.sh
   ```
   See the dashes where the `x` (execute) bits should be?
3. Add the execute bit:
   ```
   chmod +x reveal.sh
   ```
4. Now run it:
   ```
   ./reveal.sh
   ```

## Submit

```
ctf submit 06 FLAG{...}
```

## Commands you'll use

`chmod`, `ls -l`, running a script with `./`
