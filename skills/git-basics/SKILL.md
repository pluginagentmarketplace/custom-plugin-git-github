---
name: git-basics
description: Git fundamentals - init, add, commit, status, log, and core concepts
sasmp_version: "1.3.0"
bonded_agent: git-mentor
bond_type: PRIMARY_BOND
category: learning
version: "1.0.0"
triggers:
  - git basics
  - git init
  - git commands
---

# Git Basics Skill

**Essential Git operations for version control mastery.**

## Core Commands Reference

### Repository Initialization

```bash
# Create new repository
git init

# What it creates:
.git/
├── HEAD              # Current branch pointer
├── config            # Repository config
├── hooks/            # Git hooks
├── objects/          # Git object store
└── refs/             # Branch/tag references
```

### File Tracking

```bash
# Check repository status
git status

# Short status
git status -s
# M  modified
# A  added
# ?? untracked
# D  deleted

# Add files to staging
git add file.txt           # Single file
git add .                  # All files
git add *.js               # Pattern
git add -p                 # Interactive
```

### Committing Changes

```bash
# Commit with message
git commit -m "Add feature"

# Commit with detailed message
git commit
# Opens editor for multi-line message

# Amend last commit
git commit --amend

# Skip staging (tracked files only)
git commit -am "Quick fix"
```

### Viewing History

```bash
# Full log
git log

# One line per commit
git log --oneline

# With graph
git log --oneline --graph --all

# Last N commits
git log -5

# File history
git log --follow -- file.txt

# Search commits
git log --grep="bug"
git log --author="Name"
git log --since="2 weeks ago"
```

### Viewing Changes

```bash
# Working directory changes
git diff

# Staged changes
git diff --staged

# Between commits
git diff abc123 def456

# Specific file
git diff HEAD~3 -- file.txt

# Statistics only
git diff --stat
```

## Command Quick Reference

| Command | Purpose | Example |
|---------|---------|---------|
| `git init` | Create repo | `git init` |
| `git clone` | Copy repo | `git clone URL` |
| `git status` | Check state | `git status -s` |
| `git add` | Stage files | `git add .` |
| `git commit` | Save changes | `git commit -m "msg"` |
| `git log` | View history | `git log --oneline` |
| `git diff` | See changes | `git diff --staged` |
| `git show` | Show commit | `git show abc123` |

## Understanding Git Objects

```
┌─────────────────────────────────────────────────────────┐
│                    GIT OBJECTS                          │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   BLOB     ─ File content (compressed)                  │
│   TREE     ─ Directory listing (blob + tree refs)       │
│   COMMIT   ─ Snapshot + metadata + parent link          │
│   TAG      ─ Named pointer to commit                    │
│                                                         │
│   commit ─┬─► tree ─┬─► blob (file1.txt)               │
│           │         ├─► blob (file2.txt)               │
│           │         └─► tree (subdir/) ─► blob         │
│           │                                             │
│           └─► parent commit                             │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

## Configuration

### Essential Setup
```bash
# Identity (required)
git config --global user.name "Your Name"
git config --global user.email "email@example.com"

# Editor
git config --global core.editor "code --wait"

# Default branch
git config --global init.defaultBranch main

# View all settings
git config --list
git config --global --list
```

### Useful Aliases
```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph"
```

## File States

```
┌─────────────────────────────────────────────────────────┐
│                    FILE LIFECYCLE                       │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   Untracked ──────────────────────────────────────►     │
│       │                                                 │
│       │ git add                                         │
│       ▼                                                 │
│   Staged ─────────────────────────────────────────►     │
│       │                                                 │
│       │ git commit                                      │
│       ▼                                                 │
│   Committed/Unmodified ───────────────────────────►     │
│       │                                                 │
│       │ edit file                                       │
│       ▼                                                 │
│   Modified ──────► git add ──► Staged ──► Committed     │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

## .gitignore Patterns

```gitignore
# Ignore specific file
secret.txt

# Ignore by extension
*.log
*.tmp

# Ignore directory
node_modules/
.cache/

# Negation (don't ignore)
!important.log

# Pattern matching
**/build/       # Any directory named build
doc/**/*.pdf    # PDFs in doc subdirectories
```

## Best Practices

1. **Commit Often**: Small, focused commits
2. **Write Clear Messages**: What and why
3. **Review Before Commit**: `git diff --staged`
4. **Use .gitignore**: Keep repo clean
5. **Don't Commit Secrets**: Never!

---

*"Git basics are the foundation of all version control."*
