# Ubuntu Terminal Cheatsheet

A quick reference for getting comfortable in the Ubuntu terminal.
Open a terminal with **Ctrl + Alt + T**.

---

## The Prompt

```
username@computer:~/Documents$
   |        |       |     |
  who    machine  where  ready for input
```

`~` means your home folder (`/home/yourname`).

---

## Getting Around (Navigation)

| Command | What it does | Example |
|---|---|---|
| `pwd` | "Print Working Directory" — where am I? | `pwd` |
| `ls` | List files in current folder | `ls` |
| `ls -la` | List **all** files with details | `ls -la` |
| `cd <folder>` | Change Directory (move into a folder) | `cd Documents` |
| `cd ..` | Go up one folder | `cd ..` |
| `cd ~` | Jump to your home folder | `cd ~` |
| `cd -` | Go back to the last folder you were in | `cd -` |

---

## Working with Files & Folders

| Command | What it does |
|---|---|
| `mkdir myfolder` | Make a new folder |
| `touch notes.txt` | Make an empty file |
| `cp file1 file2` | Copy file1 to file2 |
| `cp -r folder1 folder2` | Copy a whole folder |
| `mv old.txt new.txt` | Rename (or move) a file |
| `rm file.txt` | Delete a file (**no undo!**) |
| `rm -r folder/` | Delete a folder and everything in it |

> ⚠️ **Warning:** `rm` doesn't send things to the Trash. Gone is gone.

---

## Looking Inside Files

| Command | What it does |
|---|---|
| `cat file.txt` | Print the whole file to the screen |
| `less file.txt` | Scroll through a file (press `q` to quit) |
| `head file.txt` | Show the first 10 lines |
| `tail file.txt` | Show the last 10 lines |
| `tail -f log.txt` | Watch a file as it updates (live!) |

---

## Finding Stuff

| Command | What it does |
|---|---|
| `find . -name "*.txt"` | Find all .txt files in current folder |
| `grep "hello" file.txt` | Find lines containing "hello" |
| `grep -r "hello" .` | Search inside every file in this folder |
| `which python` | Where is the `python` command installed? |

---

## Installing Software (apt)

```bash
sudo apt update              # Refresh the package list
sudo apt upgrade             # Update installed software
sudo apt install <name>      # Install something
sudo apt remove <name>       # Uninstall something
apt search <keyword>         # Search for a package
```

`sudo` = "Super User Do" — runs the command as admin. It'll ask for your password.

---

## System Info

| Command | What it does |
|---|---|
| `whoami` | Your username |
| `date` | Current date and time |
| `df -h` | How much disk space is free |
| `free -h` | How much RAM is free |
| `uname -a` | Info about the OS |
| `top` | Live view of running programs (press `q` to quit) |

---

## Stopping & Controlling Programs

| Keys | What they do |
|---|---|
| **Ctrl + C** | Stop the current program |
| **Ctrl + D** | "End of input" / log out of a shell |
| **Ctrl + L** | Clear the screen (same as `clear`) |
| **Ctrl + Z** | Pause the program (resume with `fg`) |

---

## Speed Tricks ⚡

- **Tab** — Autocomplete file names and commands. Hit it twice to see options.
- **↑ / ↓ arrows** — Scroll through your previous commands.
- **Ctrl + R** — Search through your command history. Type a few letters.
- **`!!`** — Re-run the last command. Great with sudo: `sudo !!`
- **`history`** — See everything you've typed.

---

## Pipes & Redirection (the cool stuff)

| Symbol | What it does | Example |
|---|---|---|
| `>` | Save output to a file (overwrites!) | `ls > files.txt` |
| `>>` | **Append** output to a file | `date >> log.txt` |
| `|` | Send output of one command into another | `ls | grep ".txt"` |

Example combo:
```bash
cat song-lyrics.txt | grep "love" | wc -l
```
Reads the file → keeps lines with "love" → counts them.

---

## Networking Basics

| Command | What it does |
|---|---|
| `ping google.com` | Check if you can reach a website |
| `curl https://example.com` | Download a webpage as text |
| `wget <url>` | Download a file from the internet |
| `ip a` | Show your IP address |

---

## Permissions (quick version)

```
-rwxr-xr--
 |  |  |  └── everyone else: read
 |  |  └───── group: read + execute
 |  └──────── owner: read + write + execute
 └─────────── file type (- = file, d = folder)
```

```bash
chmod +x script.sh    # Make a file executable
chmod 755 script.sh   # Common permission for scripts
```

---

## Getting Help

| Command | What it does |
|---|---|
| `man ls` | Read the manual for `ls` (press `q` to quit) |
| `ls --help` | Quick help for a command |
| `tldr ls` | Plain-English examples (install with `sudo apt install tldr`) |

---

## Survival Kit (memorize these first)

```
pwd     ls      cd      mkdir
cat     cp      mv      rm
sudo    apt     man     clear
Tab ↹   Ctrl+C  ↑       Ctrl+L
```

Master those 16, and you can survive almost anything. 🐧
