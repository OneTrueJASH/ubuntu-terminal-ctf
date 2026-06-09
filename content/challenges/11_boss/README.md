# Challenge 11 — BOSS: Operation Black Box

The final job.

Three independent fragments of a single flag are scattered across
three different evidence stashes inside `~/challenges/11_boss/`.
Each one requires a different skill from your training — you've
learned them all in earlier challenges.

When you've collected all three fragments, glue them together with
underscores between them and wrap in `FLAG{}`:

```
ctf submit 11 FLAG{fragment1_fragment2_fragment3}
```

Order matters. Each fragment is a short string of letters/digits.

---

## Leg 1 — RECON

Inside the boss directory there's a subdirectory the operator tried
to keep out of casual sight. They gave it a name the system itself
typically uses for things like settings or caches — names that the
default file listing politely ignores.

Look more thoroughly than the default listing does. Inside that
subdirectory is **Fragment 1**.

## Leg 2 — INTELLIGENCE

The `dossiers/` directory contains dozens of suspect files. Exactly
one line in one of them is prefixed with `FRAGMENT2:`. You don't
know which file. You don't have time to open them all.

There's a flag for the search tool that makes it search
**recursively** through every file under a directory at once. That's
the tool you want.

Take the value after the colon as Fragment 2.

## Leg 3 — EXFIL

The file `archive.txt` is a 5,000-line dump from the same suspect.
**Fragment 3** is on **line 1337** — a specific line in the middle.

You don't want to scroll. You don't want to print all 5,000 lines
to your screen. You want a single line from the middle of a long
file.

There's a classic Unix trick for this that combines two commands
you already know (one for the beginning of a file, one for the end)
with a pipe between them. Think about how to use them together to
extract exactly one line.

---

## Submit

```
ctf submit 11 FLAG{fragment1_fragment2_fragment3}
```

## Stuck?

```
ctf hint 11
```
