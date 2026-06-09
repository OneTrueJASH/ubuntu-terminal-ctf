# Challenge 03 — Search the Access Log

Last night, between thousands of routine HTTP requests, exactly one
attacker hit this server. They tried to be subtle but the IDS tagged
their request line with the word **`INTRUDER`** — a signature they
didn't notice they were leaving behind.

The log is at:

```
~/challenges/03_grep/access.log     (about 5,000 lines)
```

Scrolling won't cut it. You need to ask the system to extract just the
line that matches a specific string.

## Objective

Find the intruder's log line. Submit the flag embedded in it.

## Submit

```
ctf submit 03 FLAG{...}
```

## Stuck?

```
ctf hint 03
```
