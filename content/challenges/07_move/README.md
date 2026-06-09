# Challenge 07 — Stash the Loot

You've found some loot at `~/challenges/07_move/loot.txt`. To prove
you can keep it safe, you need to:

1. Create a new directory called `vault` in your home folder.
2. **Move** the loot file into that vault, renaming it to `treasure.txt`.

So the final location should be: `~/vault/treasure.txt`

**Then** read the file — the flag is inside.

## What you need to do

```
mkdir ~/vault
mv ~/challenges/07_move/loot.txt ~/vault/treasure.txt
cat ~/vault/treasure.txt
```

(`mv` does double duty in Unix: moving files AND renaming them. The
"old name" and "new name" can be in different directories.)

## Submit

```
ctf submit 07 FLAG{...}
```

The checker will verify the file is at the right place **and** that
your flag matches.

## Commands you'll use

`mkdir`, `mv`, `cat`
