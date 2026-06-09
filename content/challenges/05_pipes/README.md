# Challenge 05 — Count the Hits

A long manifesto was seized during the raid:

```
~/challenges/05_pipes/manifesto.txt
```

It rambles for a couple hundred lines. The word **`RESISTANCE`**
appears in it many times — and forensics wants the exact count.

The count itself is the flag. Submit it as `FLAG{N}` where N is the
number.

Eyeballing the file won't work; there are too many lines. You need
to make the computer count for you. There's more than one way to do
this — try to find one that uses a single command, then try a second
way that chains two small commands together with a pipe.

## Objective

Count how many times `RESISTANCE` appears in the manifesto.

## Submit

```
ctf submit 05 FLAG{N}        (replace N with the count)
```

## Stuck?

```
ctf hint 05
```
