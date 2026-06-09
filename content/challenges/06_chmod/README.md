# Challenge 06 — Unlock the Script

An insider left you a tool:

```
~/challenges/06_chmod/reveal.sh
```

Run it and you get your next flag — except the system bounces you
with **"Permission denied"**. The script is there. It belongs to you.
The problem isn't ownership; it's that the file's permission bits
don't include the right to **execute** it.

You'll need to grant that right yourself before the shell will run
the file. (Listing the file with the long-form `ls` will show you
exactly what permissions are missing.)

## Objective

Make the script executable. Run it. Submit the flag.

## Submit

```
ctf submit 06 FLAG{...}
```

## Stuck?

```
ctf hint 06
```
