---
name: git-intro
description: Introduction to Git version control - what, why, and first steps
sasmp_version: "1.3.0"
bonded_agent: git-mentor
bond_type: PRIMARY_BOND
category: learning
version: "1.0.0"
triggers:
  - what is git
  - git introduction
  - start with git
  - git for beginners
---

# Git Introduction Skill

**Your first steps into the world of version control.**

## What is Git?

```
    Without Git                    With Git
    ──────────                     ─────────

    report_v1.doc                  report.doc
    report_v2.doc                     │
    report_final.doc                  ├─ commit 1: "Initial draft"
    report_final_v2.doc               ├─ commit 2: "Added intro"
    report_REALLY_final.doc           ├─ commit 3: "Fixed typos"
    report_final_final.doc            └─ commit 4: "Final version"

    Chaos!                         Clean history!
```

## Why Use Git?

| Problem | Git Solution |
|---------|--------------|
| "Which version is latest?" | Single file, full history |
| "I broke everything!" | Time travel to any point |
| "Who changed this?" | Blame/log shows author |
| "Can't work together" | Branches, merge, resolve |
| "Lost my work!" | Every commit is backup |

## Key Concepts

### The Three Areas
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   Working Directory    Staging Area      Repository         │
│   (Your Workspace)     (Ready Room)      (Safe Storage)     │
│                                                             │
│       📁 ──────────► 📦 ──────────────► 🏠               │
│              git add        git commit                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Commits = Save Points
```
commit 3 ← (HEAD - You are here)
    ↓
commit 2 ← You can go back
    ↓
commit 1 ← Or even further back!
```

## Installation

### macOS
```bash
# Option 1: Xcode Command Line Tools
xcode-select --install

# Option 2: Homebrew
brew install git
```

### Windows
```bash
# Download from https://git-scm.com/download/windows
# Or use winget
winget install --id Git.Git -e --source winget
```

### Linux
```bash
# Ubuntu/Debian
sudo apt install git

# Fedora
sudo dnf install git

# Arch
sudo pacman -S git
```

### Verify Installation
```bash
git --version
# git version 2.42.0 (or similar)
```

## First-Time Setup

```bash
# Tell Git who you are (REQUIRED)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Optional but recommended
git config --global init.defaultBranch main
git config --global core.editor "code --wait"  # VS Code

# Verify your settings
git config --list
```

## Your First Repository

```bash
# 1. Create a folder
mkdir my-first-project
cd my-first-project

# 2. Initialize Git (creates .git folder)
git init
# Initialized empty Git repository in .../my-first-project/.git/

# 3. Create a file
echo "# My Project" > README.md

# 4. Check status
git status
# On branch main
# Untracked files: README.md

# 5. Stage the file
git add README.md

# 6. Commit (save!)
git commit -m "Initial commit: Add README"

# 7. View history
git log
```

## Common First Commands

| Command | What It Does | When To Use |
|---------|--------------|-------------|
| `git init` | Start tracking folder | Once per project |
| `git status` | Show current state | Constantly! |
| `git add` | Prepare files for commit | Before commit |
| `git commit` | Save your work | When complete unit of work |
| `git log` | View history | To see past commits |

## Quick Reference Card

```
┌────────────────────────────────────────────────────────────┐
│                    GIT CHEAT SHEET                         │
├────────────────────────────────────────────────────────────┤
│ START                                                      │
│   git init              Create new repo                    │
│   git clone <url>       Download existing repo             │
│                                                            │
│ DAILY WORK                                                 │
│   git status            What's going on?                   │
│   git add <file>        Stage file                         │
│   git add .             Stage all                          │
│   git commit -m "msg"   Save with message                  │
│                                                            │
│ HISTORY                                                    │
│   git log               View commits                       │
│   git log --oneline     Compact view                       │
│   git diff              See changes                        │
└────────────────────────────────────────────────────────────┘
```

## Next Steps

After mastering this skill, proceed to:
1. **basic-workflow** - Daily Git operations
2. **git-basics** - Deeper understanding
3. **branching** - Work in parallel

---

*"Every expert was once a beginner. Welcome to Git!"*
