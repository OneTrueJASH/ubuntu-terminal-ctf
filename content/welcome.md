# Welcome to the Ubuntu Terminal CTF

You're SSH'd into a freshly compromised box. There are **10 challenges
plus a boss level** hidden around the filesystem. Each one teaches one
or two commands from the terminal cheatsheet; the boss combines several.

## How it works

1. List the challenges:
   ```
   ctf list
   ```
2. Open one up to read the briefing:
   ```
   ctf start 01
   ```
3. Each challenge is a **scenario, not a recipe.** You'll be told the
   situation and the goal — but not which commands to use or what
   syntax to type. That part is your job. The
   [TERMINAL_CHEATSHEET](../TERMINAL_CHEATSHEET.md) covers every
   command you'll need; think about what you're trying to accomplish,
   then check the cheatsheet for the right tool.
4. Submit the flag:
   ```
   ctf submit 01 FLAG{...}
   ```
   (Some challenges are state-based: `ctf submit NN` with no flag
   will check that you actually moved/killed/created the right thing.)
5. Check your progress any time:
   ```
   progress
   ```

## Need a hint?

```
ctf hint 03
```

Hints are **nudges**, not solutions. They'll usually point you to the
right command name, but you'll still need to look up the exact flag or
syntax yourself. That's deliberate — every time you check `--help` or
`man`, you're building muscle memory you'll use for the rest of your
career.

## Stuck on a command?

If you forget what flags or arguments a command takes:

```
man find        # full manual (press q to quit)
find --help     # quick help summary
```

These two commands work for almost every tool on the system. They're
the single most useful habit you can build as a terminal user.

Good luck.
