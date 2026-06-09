# Ubuntu Terminal CTF

**10 hacker-themed challenges + a boss level**, packaged as a Docker image. Built to teach a beginner all the commands on a basic Ubuntu terminal cheatsheet — without them needing to install Ubuntu, configure SSH, or even know what Docker is.

Each challenge has a story (find a backdoor, kill the decoy, search the access log) and rewards them with a `FLAG{…}` they can submit through a built-in `ctf` command.

---

## For students — get started (about 5 minutes)

You need:
- A Mac or Linux computer
- [Docker installed](https://docs.docker.com/get-docker/)

Open a terminal (on Mac: `Cmd+Space → Terminal`; on Linux: `Ctrl+Alt+T`) and run:

### 1. Download the CTF image

```bash
curl -LO https://github.com/OneTrueJASH/ubuntu-terminal-ctf/releases/latest/download/ubuntu-terminal-ctf.tar.gz
```

### 2. Load it and start the container

```bash
gunzip -c ubuntu-terminal-ctf.tar.gz | docker load
docker run -d --name ctf -p 2222:22 ubuntu-terminal-ctf:latest
```

### 3. SSH into the container

```bash
ssh hacker@localhost -p 2222
```

When prompted:
- Type `yes` to accept the fingerprint (first time only)
- Password: **`hacker`**

### 4. Start hacking

Once you're in:

```bash
ctf list           # show all challenges
ctf start 01       # open the first challenge's instructions
ctf hint 01        # need a hint?
ctf submit 01 FLAG{...}  # turn in a flag
```

Work your way through 01 → 10, then take on **challenge 11** (the boss).

> 📖 The companion **[TERMINAL_CHEATSHEET.md](./TERMINAL_CHEATSHEET.md)** covers every command you'll need. Read it once before you start, then refer back when stuck.

---

## What you'll learn

| Challenge | Topic | Commands |
|---|---|---|
| 01 | Navigation & hidden files | `cd`, `ls -la`, `cat` |
| 02 | Finding files | `find` |
| 03 | Searching text | `grep` |
| 04 | First & last lines | `head`, `tail` |
| 05 | Pipes & counting | `grep`, `wc`, `\|` |
| 06 | Permissions | `chmod +x` |
| 07 | Move & rename | `mkdir`, `mv` |
| 08 | Redirection | `>`, `>>` |
| 09 | Process management | `ps`, `kill` |
| 10 | Network requests | `curl` |
| 11 | **BOSS** — chained heist | `ls -la`, `grep -r`, `head` + `tail` + `\|`, assembly |

---

## When you're done

Stop the container:
```bash
docker stop ctf
```

Start it again later (your progress is saved):
```bash
docker start ctf
ssh hacker@localhost -p 2222
```

Wipe everything and start over:
```bash
docker rm -f ctf
docker run -d --name ctf -p 2222:22 ubuntu-terminal-ctf:latest
```

---

## For instructors / operators — building from source

If you want to modify the challenges or rebuild the image:

```bash
git clone https://github.com/OneTrueJASH/ubuntu-terminal-ctf.git
cd ubuntu-terminal-ctf
./build.sh        # builds the docker image
./run.sh          # runs it locally on port 2222
./export.sh       # rebuilds the .tar.gz for distribution
```

### Modifying challenges

Each challenge lives in `content/challenges/NN_topic/`:
- `README.md` — what the student sees
- `build.sh` (optional) — generates synthetic content at image build time (logs, haystacks)
- Static data files

To add a new challenge:
1. Create `content/challenges/NN_yourname/README.md`
2. Add a SHA-256 of your flag to `content/flags.sha256`: `printf %s 'FLAG{your_flag}' | sha256sum`
3. Add a one-line hint to `content/hints.txt`
4. (Optional) Add a state-based checker at `content/checks/NN.sh`
5. Rebuild

The `ctf list` command discovers challenges by globbing, so the framework picks new ones up automatically.

### Security notes

This is a **learning sandbox**, not a hardened production image. The `hacker` user has a guessable password (`hacker`); don't expose port 2222 to the internet. Run it on a student's laptop or behind a firewall on a local LAN box. There's no `sudo` available inside the container — the student can't escape into the host unless Docker itself is misconfigured.

### File layout

```
.
├── Dockerfile                # ubuntu:22.04 base + sshd + CLI tooling
├── build.sh                  # docker build
├── run.sh                    # docker run (local testing)
├── export.sh                 # docker save | gzip → tarball
├── README.md                 # this file
├── TERMINAL_CHEATSHEET.md    # student companion reference
├── LICENSE
└── content/                  # everything baked into the image
    ├── start.sh              # container entrypoint (starts sshd + bg services)
    ├── install.sh            # one-shot setup during image build
    ├── motd                  # SSH login banner
    ├── bashrc-additions      # PS1, aliases, login hook
    ├── welcome.md            # /home/hacker/README.md inside the container
    ├── flags.sha256          # hashed flag answers (one line per challenge)
    ├── hints.txt             # one-line hints per challenge
    ├── bin/                  # ctf, submit, progress, launch_bg (decoy spawner)
    ├── checks/               # state-based validators (07, 08, 09)
    ├── challenges/           # one folder per challenge
    └── web/                  # files served on :8080 (challenge 10)
```

---

## License

MIT — see [LICENSE](./LICENSE). Made for a high schooler. Take it, fork it, ship your own version.
