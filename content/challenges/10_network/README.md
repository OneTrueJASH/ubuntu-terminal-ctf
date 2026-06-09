# Challenge 10 — Knock on Localhost

Recon shows an internal web service running on **this host**, port
**8080**. It's not reachable from the outside world, but you're
already inside the network — you can talk to it directly.

Somewhere on that service, at the path `/flag.txt`, the next clue
is waiting.

There's no browser available in the terminal. But you do have a
tool that takes a URL, fetches whatever's at it, and prints the
contents straight to your screen.

The URL you want will look like:

```
http://localhost:8080/flag.txt
```

## Objective

Pull the flag from the web service. Submit it.

## Submit

```
ctf submit 10 FLAG{...}
```

## Stuck?

```
ctf hint 10
```
