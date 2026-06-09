# Challenge 09 — Kill the Decoy

There's a rogue background process running on this machine called
**`decoy_daemon`**. Your job: find it and kill it.

**Goal:** stop the `decoy_daemon` process.

## What you need to do

1. List all running processes:
   ```
   ps aux
   ```
   (lots of output! pipe it into grep to narrow down)
2. Find the decoy:
   ```
   ps aux | grep decoy_daemon
   ```
   Note the PID (process ID) — the second column.
3. Kill it (replace PID with the actual number):
   ```
   kill <PID>
   ```
   Or, easier, kill it by name with:
   ```
   pkill -f decoy_daemon
   ```

## Submit

Once the decoy is dead, run:
```
ctf submit 09
```
No flag needed — the checker confirms the process is gone.

## Commands you'll use

`ps`, `grep`, `|`, `kill` (or `pkill`)
