---
name: collaboration
description: Team collaboration - remote, fetch, pull, push, clone, and team workflows
sasmp_version: "1.3.0"
bonded_agent: git-expert
bond_type: PRIMARY_BOND
category: development
version: "1.0.0"
triggers:
  - git remote
  - git push
  - git pull
  - team git
---

# Collaboration Skill

**Working with remote repositories and teams.**

## Remote Repository Basics

### Understanding Remotes
```bash
# List remotes
git remote -v

# Add remote
git remote add origin https://github.com/user/repo.git
git remote add upstream https://github.com/original/repo.git

# Remove remote
git remote remove origin

# Change remote URL
git remote set-url origin https://github.com/user/new-repo.git

# Rename remote
git remote rename origin github
```

### Clone vs Fork vs Mirror

| Operation | Purpose | Command |
|-----------|---------|---------|
| Clone | Copy for development | `git clone URL` |
| Fork | Copy to your account | GitHub UI + clone |
| Mirror | Exact backup | `git clone --mirror URL` |

## Getting Changes

### Fetch (Safe)
```bash
# Get remote changes without merging
git fetch origin

# Fetch all remotes
git fetch --all

# Fetch and prune deleted branches
git fetch --prune
```

### Pull (Fetch + Merge)
```bash
# Pull default branch
git pull

# Pull specific remote/branch
git pull origin main

# Pull with rebase (cleaner history)
git pull --rebase origin main

# Pull with autostash
git pull --autostash
```

### Comparison
```
┌─────────────────────────────────────────────────────────────┐
│                  FETCH vs PULL                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  FETCH:                                                     │
│    Remote ──────► origin/main                               │
│                   (just updates references)                 │
│                                                             │
│  PULL:                                                      │
│    Remote ──────► origin/main ──────► main                  │
│                   (fetch)           (merge)                 │
│                                                             │
│  Recommendation: Prefer fetch + merge for more control      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Sharing Changes

### Push
```bash
# Push to tracked remote
git push

# Push to specific remote/branch
git push origin main

# Set upstream and push
git push -u origin feature-branch

# Force push (DANGEROUS!)
git push --force

# Safe force push
git push --force-with-lease
```

### When Force Push is Needed

| Scenario | Use Case | Safety |
|----------|----------|--------|
| After rebase | History changed | Use --force-with-lease |
| Amend pushed commit | Fix mistake | Only on personal branches |
| Clean up PR | Squash commits | After communication |

## Team Workflows

### Fork + Pull Request
```bash
# 1. Fork on GitHub
# 2. Clone your fork
git clone https://github.com/YOU/repo.git

# 3. Add upstream
git remote add upstream https://github.com/ORIGINAL/repo.git

# 4. Create feature branch
git checkout -b feature-x

# 5. Make changes and commit
git add .
git commit -m "feat: add feature"

# 6. Push to your fork
git push -u origin feature-x

# 7. Create PR on GitHub
```

### Sync Fork with Upstream
```bash
# Fetch upstream changes
git fetch upstream

# Merge into your main
git checkout main
git merge upstream/main

# Push to your fork
git push origin main
```

### Feature Branch Workflow
```
┌─────────────────────────────────────────────────────────────┐
│              FEATURE BRANCH WORKFLOW                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. git checkout main                                       │
│  2. git pull origin main                                    │
│  3. git checkout -b feature/name                            │
│  4. # ... work and commit ...                               │
│  5. git push -u origin feature/name                         │
│  6. # Create PR on GitHub                                   │
│  7. # After review and merge                                │
│  8. git checkout main                                       │
│  9. git pull origin main                                    │
│ 10. git branch -d feature/name                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Conflict Resolution in Teams

### Before Merging PR
```bash
# Update your branch with latest main
git checkout feature-x
git fetch origin
git rebase origin/main

# If conflicts:
# 1. Resolve conflicts in files
# 2. git add .
# 3. git rebase --continue

# Force push updated branch
git push --force-with-lease
```

### Communication Best Practices

| Situation | Action |
|-----------|--------|
| Before force push | Notify team |
| Resolving conflicts | Consult original author |
| Merging large PR | Get second review |
| Breaking changes | Document and announce |

## Multi-Remote Setup

```bash
# Common setup for contributors
git remote -v
# origin    https://github.com/YOU/repo.git (your fork)
# upstream  https://github.com/ORIGINAL/repo.git (main repo)

# For maintainers
git remote -v
# origin    https://github.com/ORG/repo.git (main)
# staging   https://github.com/ORG/repo-staging.git
```

## Command Reference

| Command | Purpose |
|---------|---------|
| `git clone` | Copy repository |
| `git remote` | Manage remotes |
| `git fetch` | Get changes (no merge) |
| `git pull` | Get and merge changes |
| `git push` | Send changes |
| `git push -u` | Push and set upstream |

---

*"Great software is built by teams, and Git makes collaboration possible."*
