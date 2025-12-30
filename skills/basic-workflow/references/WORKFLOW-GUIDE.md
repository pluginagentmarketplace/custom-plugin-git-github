# Git Basic Workflow Reference Guide

## The Golden Workflow

```bash
# The workflow you'll use 95% of the time
git pull           # Sync with team
git status         # Check what's happening
git add <files>    # Stage changes
git commit -m ""   # Save changes
git push           # Share changes
```

## Understanding Git Areas

### The Three Trees

1. **Working Directory**: Your actual files
2. **Staging Area (Index)**: Changes ready to commit
3. **Repository (HEAD)**: Committed history

```
Working Directory ─→ Staging ─→ Repository
      (edit)        (git add)   (git commit)
```

## Command Deep Dive

### git status
Shows the state of your working directory and staging area.

```bash
git status

# Output Legend:
# - "Changes to be committed" = Staged (green)
# - "Changes not staged for commit" = Modified (red)
# - "Untracked files" = New files (red)
```

### git add
Stages changes for the next commit.

```bash
# Stage specific file
git add file.txt

# Stage multiple files
git add file1.txt file2.txt

# Stage by pattern
git add *.js

# Stage all in directory
git add src/

# Stage everything
git add .

# Interactive staging (choose hunks)
git add -p
```

### git commit
Records changes to the repository.

```bash
# Quick commit
git commit -m "Fix login bug"

# Open editor for message
git commit

# Add and commit (tracked files only)
git commit -am "Quick fix"

# Amend last commit
git commit --amend
```

### git push
Uploads commits to remote repository.

```bash
# Push to default remote
git push

# Push specific branch
git push origin main

# Set upstream and push
git push -u origin feature-branch

# Force push (DANGEROUS!)
git push --force

# Safe force push
git push --force-with-lease
```

### git pull
Downloads changes from remote and integrates.

```bash
# Pull from tracked remote
git pull

# Pull from specific remote/branch
git pull origin main

# Pull with rebase (cleaner history)
git pull --rebase
```

## Viewing History

### git log

```bash
# Basic log
git log

# One line per commit
git log --oneline

# With graph
git log --oneline --graph

# Last N commits
git log -5

# By author
git log --author="Name"

# By date
git log --since="2 weeks ago"
git log --after="2023-01-01"

# Changes in file
git log -- path/to/file

# Search in messages
git log --grep="bug"
```

### git diff

```bash
# Unstaged changes
git diff

# Staged changes
git diff --staged

# Between commits
git diff abc123 def456

# Specific file
git diff README.md

# Summary only
git diff --stat
```

## Undoing Things

### Unstage a File
```bash
git restore --staged file.txt
# or
git reset HEAD file.txt
```

### Discard Local Changes
```bash
# Single file
git restore file.txt
# or
git checkout -- file.txt

# All files (CAREFUL!)
git restore .
```

### Undo Last Commit
```bash
# Keep changes staged
git reset --soft HEAD~1

# Keep changes unstaged
git reset HEAD~1

# Discard changes (DANGEROUS!)
git reset --hard HEAD~1
```

### Revert a Commit (Safe)
```bash
# Creates a new commit that undoes changes
git revert abc123
```

## .gitignore Best Practices

```gitignore
# Dependencies
node_modules/
vendor/
venv/

# Build outputs
dist/
build/
*.o
*.class

# Environment
.env
.env.local
*.log

# OS files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp

# Secrets (NEVER commit these!)
*.pem
*.key
credentials.json
```

## Pre-Commit Checklist

- [ ] Run `git status` to see all changes
- [ ] Run `git diff` to review modifications
- [ ] Ensure tests pass locally
- [ ] Check for debug code/console.log
- [ ] Verify no secrets in changes
- [ ] Write clear commit message

## Troubleshooting

### "Updates were rejected"
```bash
# Someone pushed before you
git pull --rebase
git push
```

### "You have unstaged changes"
```bash
# Option 1: Commit them
git add .
git commit -m "WIP"

# Option 2: Stash them
git stash
# do your other work
git stash pop
```

### "Merge conflict"
```bash
# 1. Open conflicting file
# 2. Look for <<<<<<< markers
# 3. Edit to resolve
# 4. Remove markers
# 5. Stage and commit
git add .
git commit -m "Resolve conflicts"
```

---

*Last Updated: 2025-12-29*
