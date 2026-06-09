# Challenge 10 — Knock on Localhost

This machine is running a tiny web server on **port 8080**. There's
a flag file served at the path `/flag.txt`.

**Goal:** fetch the flag with `curl`.

## What you need to do

```
curl http://localhost:8080/flag.txt
```

That's it! `curl` downloads whatever URL you give it and prints it.

Bonus: try
```
curl http://localhost:8080/
```
to see what else is being served.

## Submit

```
ctf submit 10 FLAG{...}
```

## Commands you'll use

`curl`
