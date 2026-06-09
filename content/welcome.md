# Welcome to the Ubuntu Terminal CTF

You're SSH'd into a freshly compromised box. There are **10 challenges
plus a boss level** hidden around the filesystem. Each one teaches one
or two commands from the terminal cheatsheet; the boss combines several.

## How it works

1. List the challenges:
   ```
   ctf list
   ```
2. Open one up to read what's expected:
   ```
   ctf start 01
   ```
3. Solve it — usually by exploring the filesystem with the right command —
   to find a flag like `FLAG{something_clever}`.
4. Submit the flag:
   ```
   ctf submit 01 FLAG{...}
   ```
   (Some challenges are state-based: `ctf submit NN` with no flag will
   check that you actually moved/killed/created the right thing.)
5. Check your progress any time:
   ```
   progress
   ```

## Need a hint?

```
ctf hint 03
```

## Stuck on a command?

Everything in your cheatsheet should be enough. If you forget the syntax:

```
man find        # full manual (press q to quit)
find --help     # quick help summary
```

Good luck.
