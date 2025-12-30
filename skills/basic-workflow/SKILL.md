---
name: basic-workflow
description: Daily Git workflow - add, commit, push, pull cycle for everyday development
sasmp_version: "1.3.0"
bonded_agent: git-mentor
bond_type: PRIMARY_BOND
category: learning
version: "1.0.0"
triggers:
  - git workflow
  - daily git
  - add commit push
  - git cycle
---

# Basic Workflow Skill

**Master the daily rhythm of Git operations.**

## The Daily Cycle

```
┌──────────────────────────────────────────────────────────────┐
│                    DAILY GIT WORKFLOW                        │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│   Morning:  git pull        ← Get latest from team          │
│             │                                                │
│             ▼                                                │
│   Work:     (make changes)  ← Do your development           │
│             │                                                │
│             ▼                                                │
│   Check:    git status      ← See what changed              │
│             │                                                │
│             ▼                                                │
│   Stage:    git add         ← Prepare for saving            │
│             │                                                │
│             ▼                                                │
│   Save:     git commit      ← Save your work                │
│             │                                                │
│             ▼                                                │
│   Share:    git push        ← Share with team               │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

## Essential Commands

### 1. Start Your Day: `git pull`
```bash
# Get the latest changes from remote
git pull origin main

# What it does:
# 1. Fetches changes from remote
# 2. Merges them into your branch
```

### 2. Check Status: `git status`
```bash
git status

# Output explains:
# - Modified files (red = not staged)
# - Staged files (green = ready to commit)
# - Untracked files (new files)
```

### 3. View Changes: `git diff`
```bash
# See unstaged changes
git diff

# See staged changes
git diff --staged

# See changes for specific file
git diff README.md
```

### 4. Stage Changes: `git add`
```bash
# Add specific file
git add README.md

# Add multiple files
git add file1.js file2.js

# Add all files in directory
git add src/

# Add all changes (use carefully!)
git add .

# Interactive staging
git add -p  # Review each change
```

### 5. Commit Changes: `git commit`
```bash
# Commit with inline message
git commit -m "Add user authentication"

# Commit with detailed message (opens editor)
git commit

# Add and commit in one step (tracked files only)
git commit -am "Quick fix for typo"
```

### 6. Share Your Work: `git push`
```bash
# Push to remote
git push origin main

# First push of a new branch
git push -u origin feature-branch
```

## Workflow Patterns

### Pattern 1: Solo Work
```bash
# Start of day
git pull

# Throughout day
git status
git add .
git commit -m "Feature: Add login form"
git push
```

### Pattern 2: Feature Development
```bash
# Create feature branch
git checkout -b feature/user-settings

# Work and commit multiple times
git add src/settings.js
git commit -m "Add settings page structure"

git add src/settings.css
git commit -m "Style settings page"

# Push branch
git push -u origin feature/user-settings
```

### Pattern 3: Quick Fix
```bash
git checkout main
git pull
git add fix.js
git commit -m "Fix: Button alignment on mobile"
git push
```

## The Perfect Commit

### What Makes a Good Commit?

| Attribute | Description |
|-----------|-------------|
| **Atomic** | One logical change |
| **Complete** | Tests pass, code works |
| **Descriptive** | Clear message |
| **Small** | Easier to review and revert |

### Commit Message Format
```
type: subject line (50 chars max)

body: detailed explanation (optional)
- what you did
- why you did it
- any side effects

Closes #123  (optional: reference issues)
```

### Types
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation only
- `style:` Formatting (no code change)
- `refactor:` Code restructure
- `test:` Adding tests
- `chore:` Maintenance

## Common Scenarios

### Scenario 1: "Oops, wrong file!"
```bash
# Remove from staging (keep file)
git restore --staged accidental-file.txt

# Or the older syntax
git reset HEAD accidental-file.txt
```

### Scenario 2: "I want to undo my changes"
```bash
# Undo changes in working directory (DESTRUCTIVE!)
git restore file.txt

# Or restore all files
git restore .
```

### Scenario 3: "I forgot to add a file to last commit"
```bash
git add forgotten-file.txt
git commit --amend --no-edit
# Note: Only do this BEFORE pushing!
```

### Scenario 4: "I need to see what I did yesterday"
```bash
git log --oneline --since="yesterday"
git log --oneline -10  # Last 10 commits
git log --oneline --author="Your Name"
```

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────┐
│              DAILY WORKFLOW CHEATSHEET                  │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  START DAY         git pull                             │
│                                                         │
│  CHECK WORK        git status                           │
│                    git diff                             │
│                                                         │
│  SAVE WORK         git add <files>                      │
│                    git commit -m "message"              │
│                                                         │
│  SHARE WORK        git push                             │
│                                                         │
│  VIEW HISTORY      git log --oneline                    │
│                                                         │
│  UNDO STAGING      git restore --staged <file>          │
│                                                         │
│  UNDO CHANGES      git restore <file>                   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

## Avoiding Common Mistakes

| Mistake | Prevention |
|---------|------------|
| Committing sensitive data | Use `.gitignore`, review before commit |
| Giant commits | Commit frequently, one change at a time |
| Vague messages | Follow commit message format |
| Forgetting to pull | Always pull before starting work |
| Pushing broken code | Test before pushing |

## Next Steps

After mastering basic workflow:
1. **branching** - Work on features in isolation
2. **collaboration** - Work with team members
3. **advanced-git** - Power user operations

---

*"Consistent workflow leads to reliable code history."*
