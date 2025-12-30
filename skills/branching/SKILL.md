---
name: branching
description: Git branching strategies - create, switch, merge, rebase, and workflows
sasmp_version: "1.3.0"
bonded_agent: git-expert
bond_type: PRIMARY_BOND
category: development
version: "1.0.0"
triggers:
  - git branch
  - git merge
  - git rebase
  - branching strategy
---

# Branching Skill

**Effective branching and merging strategies for development workflows.**

## Branch Basics

```bash
# List branches
git branch              # Local branches
git branch -r           # Remote branches
git branch -a           # All branches

# Create branch
git branch feature-x    # Create only
git checkout -b feature-x  # Create and switch
git switch -c feature-x    # Modern syntax

# Switch branches
git checkout main
git switch main         # Modern syntax

# Delete branch
git branch -d feature-x     # Safe delete
git branch -D feature-x     # Force delete
git push origin --delete feature-x  # Delete remote
```

## Branching Strategies

### GitFlow
```
┌─────────────────────────────────────────────────────────────┐
│                       GITFLOW                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ main    ●─────────────────●───────────────●──────────►     │
│          ↑                 ↑               ↑                │
│ release  ├─────●───────────┤               │                │
│          │     ↑           │               │                │
│ develop  ├──●──┴──●──●──●──┴──●──●──●──●──┴──●──●──────►   │
│          │  ↑     ↑     ↑     ↑     ↑                       │
│ feature  └──┴─────┴─────┴─────┴─────┘                       │
│                                                             │
│ Branches:                                                   │
│   main     - Production-ready code                          │
│   develop  - Integration branch                             │
│   feature/ - New features                                   │
│   release/ - Release preparation                            │
│   hotfix/  - Production fixes                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### GitHub Flow (Simpler)
```
┌─────────────────────────────────────────────────────────────┐
│                     GITHUB FLOW                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ main     ●────────●────────●────────●────────●─────────►   │
│           \      ↑  \     ↑  \     ↑                        │
│ feature    \────●    \───●    \───●                         │
│            (PR)     (PR)     (PR)                           │
│                                                             │
│ Rules:                                                      │
│   1. main is always deployable                              │
│   2. Branch from main for features                          │
│   3. Open PR when ready                                     │
│   4. Merge after review                                     │
│   5. Deploy immediately after merge                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Trunk-Based Development
```
┌─────────────────────────────────────────────────────────────┐
│                  TRUNK-BASED DEV                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ main    ●──●──●──●──●──●──●──●──●──●──●──●──●─────────►    │
│            ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑                 │
│          (frequent small commits to main)                   │
│                                                             │
│ Rules:                                                      │
│   - Short-lived branches (< 1 day)                          │
│   - Feature flags for incomplete work                       │
│   - Continuous integration required                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Merging Strategies

### Fast-Forward Merge
```bash
# When branch is ahead and no divergence
git checkout main
git merge feature-x
# No merge commit created, just pointer moves
```

### Three-Way Merge
```bash
# When branches have diverged
git checkout main
git merge feature-x
# Creates merge commit with two parents
```

### Squash Merge
```bash
# Combine all commits into one
git checkout main
git merge --squash feature-x
git commit -m "Add feature X"
# Cleaner history, loses individual commits
```

## Rebasing

### Basic Rebase
```bash
# Replay commits on top of another branch
git checkout feature-x
git rebase main

# Before:
# main:     A──B──C
# feature:       \──D──E

# After:
# main:     A──B──C
# feature:           \──D'──E'
```

### Interactive Rebase
```bash
# Edit, squash, reorder commits
git rebase -i HEAD~5

# Commands in editor:
# pick   - use commit
# reword - edit message
# edit   - stop and amend
# squash - combine with previous
# fixup  - squash, discard message
# drop   - remove commit
```

### Rebase vs Merge

| Aspect | Merge | Rebase |
|--------|-------|--------|
| History | Preserves full history | Linear history |
| Merge commits | Creates merge commits | No merge commits |
| Conflicts | Resolve once | May resolve multiple times |
| Safety | Safe for shared branches | Never on shared branches |
| Traceability | Shows when merged | Shows logical sequence |

## Conflict Resolution

```bash
# When conflict occurs:
CONFLICT (content): Merge conflict in file.txt

# 1. Open file, find markers
<<<<<<< HEAD
Your changes
=======
Their changes
>>>>>>> feature-x

# 2. Edit to resolve (keep one, both, or custom)
The final resolved content

# 3. Mark resolved
git add file.txt

# 4. Continue
git merge --continue
# or
git rebase --continue
```

## Branch Commands Reference

| Command | Purpose |
|---------|---------|
| `git branch` | List branches |
| `git branch name` | Create branch |
| `git checkout name` | Switch branch |
| `git checkout -b name` | Create & switch |
| `git switch name` | Switch (modern) |
| `git switch -c name` | Create & switch (modern) |
| `git branch -d name` | Delete (safe) |
| `git branch -D name` | Delete (force) |
| `git merge name` | Merge branch |
| `git rebase name` | Rebase onto branch |

## Best Practices

1. **Use descriptive branch names**: `feature/user-auth`, `fix/login-bug`
2. **Keep branches short-lived**: Merge frequently
3. **Rebase before merge**: Keep history clean
4. **Delete merged branches**: Avoid clutter
5. **Never force push to shared branches**

---

*"Branches are cheap in Git - use them liberally."*
