# Challenge 09 — Kill the Decoy

Something is running on this host that shouldn't be: a background
process named **`decoy_daemon`**. It's harmless for now — sleeping
in a loop — but on a real operation you'd want it gone immediately.

There's no GUI here. You can't right-click and "End Task." Instead
you ask the kernel to list every process currently running, find
the decoy by its name, note its PID (process ID), and then send it
the kill signal yourself.

(Hint: piping a process listing into `grep` is a fast way to filter
down to just the one you want.)

## Objective

Locate the decoy process. Terminate it. Confirm it's gone.

## Submit

```
ctf submit 09
```

No flag — the checker verifies the process is no longer running. If
it's still alive, the checker will tell you and remind you of the
PID.

## Stuck?

```
ctf hint 09
```
