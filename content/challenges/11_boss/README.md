# Challenge 11 — BOSS: Operation Black Box

You've earned this. The final job. Three fragments of a single flag are
scattered across three different evidence locations. Each one requires
a different command (or combination of commands) from your training.

When you've assembled all three, submit:

```
ctf submit 11 FLAG{fragment1_fragment2_fragment3}
```

The fragments will look like short strings (letters, digits, an
occasional special character). Glue them with **underscores**.

---

## Leg 1 — RECON  (find a hidden file)

There's a hidden directory inside `~/challenges/11_boss/` whose name
starts with a dot. Inside it is a file containing **Fragment 1**.

You need:
- `ls -la` to reveal hidden entries
- `cat` to read the file

---

## Leg 2 — INTELLIGENCE  (search across many files)

The `dossiers/` directory contains dozens of suspect files. Exactly
one line in one of them starts with the word **`FRAGMENT2:`**.

You need:
- `grep -r PATTERN DIRECTORY` — the `-r` flag makes grep search
  **recursively** through every file under the directory.

Example:
```
grep -r "FRAGMENT2:" dossiers/
```

---

## Leg 3 — EXFIL  (extract a specific line from a long file)

The file `archive.txt` has thousands of lines. **Fragment 3** is on
**line 1337**.

There's a classic Unix trick for this — combine `head` and `tail`:

```
head -n 1337 archive.txt | tail -n 1
```

- `head -n 1337` takes the first 1337 lines.
- `tail -n 1` takes the last 1 line of THAT.
- The result: just line 1337.

---

## Assemble

Once you have all three fragments, join them with underscores and wrap
in `FLAG{...}`. Submit.

## Commands you'll use

`ls -la`, `cat`, `grep -r`, `head`, `tail`, `|` (pipe)
