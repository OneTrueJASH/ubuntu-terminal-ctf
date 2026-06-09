# Challenge 02 — Needle in a Haystack

A previous admin left a backdoor file somewhere in a giant directory
tree. You don't know which folder it's in — but you know its name
ends with **`.key`**.

**Goal:** locate the `.key` file and read the flag inside it.

## What you need to do

1. Look at the haystack:
   `ls ~/challenges/02_find/haystack/` — there are a LOT of files.
2. Use `find` to search recursively for files matching `*.key`.
   `find` syntax:
   ```
   find <where_to_search> -name "<pattern>"
   ```
3. Once you have the path, `cat` the file to read the flag.

## Submit

```
ctf submit 02 FLAG{...}
```

## Commands you'll use

`find`, `cat`
