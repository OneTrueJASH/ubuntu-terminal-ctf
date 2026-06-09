# Challenge 07 — Stash the Loot

You've recovered some loot:

```
~/challenges/07_move/loot.txt
```

Operational discipline says you can't leave it sitting where you
found it. You need to stash it in a vault. The vault doesn't exist
yet — you'll have to create one inside your home directory. Once
the vault exists, transfer the file into it.

For extra cover, rename it during the move from `loot.txt` to
`treasure.txt` — anyone searching for "loot" will come up empty.

When you're done, the final path should be:

```
~/vault/treasure.txt
```

The flag is inside the file. Read it after the move.

## Objective

1. Create the vault directory.
2. Move the loot into it, renaming as you go.
3. Submit the flag from inside.

## Submit

```
ctf submit 07 FLAG{...}
```

The checker confirms both that the file ended up at the right path
AND that the flag you submit matches.

## Stuck?

```
ctf hint 07
```
