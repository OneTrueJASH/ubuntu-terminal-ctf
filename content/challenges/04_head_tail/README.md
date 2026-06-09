# Challenge 04 — Message in a Bottle

A poem file has the flag **split in two**:
the first piece is on the **first line**, the second piece is on the
**last line**. The middle is just decoy text.

**Goal:** assemble the full flag.

## What you need to do

1. The file is:
   `~/challenges/04_head_tail/poem.txt`
2. Use `head` to read the **first** line of the file:
   ```
   head -n 1 <file>
   ```
3. Use `tail` to read the **last** line:
   ```
   tail -n 1 <file>
   ```
4. Stick the two halves together (no spaces) — that's your flag.

## Submit

```
ctf submit 04 FLAG{...}
```

## Commands you'll use

`head`, `tail`
