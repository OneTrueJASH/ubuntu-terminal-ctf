# Challenge 03 — Search the Access Log

The server's access log has thousands of normal requests and exactly
**one** suspicious entry. The intruder's request line contains the
word `INTRUDER`.

**Goal:** find that one line — it contains the flag.

## What you need to do

1. The log file is:
   `~/challenges/03_grep/access.log`
2. Use `grep` to search for the suspicious entry:
   ```
   grep "<word>" <file>
   ```
3. The matching line will have the flag.

## Submit

```
ctf submit 03 FLAG{...}
```

## Commands you'll use

`grep`
