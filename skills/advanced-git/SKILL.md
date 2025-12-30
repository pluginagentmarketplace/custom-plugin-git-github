---
name: advanced-git
description: Advanced Git - interactive rebase, cherry-pick, bisect, reflog, and power user operations
sasmp_version: "1.3.0"
bonded_agent: git-expert
bond_type: SECONDARY_BOND
category: development
version: "1.0.0"
triggers:
  - git reflog
  - git bisect
  - cherry pick
  - interactive rebase
---

# Advanced Git Skill

**Power user Git operations and debugging.**

## Recovery Operations

### Reflog: Your Safety Net
```bash
# View all HEAD movements
git reflog

# Output example:
abc1234 HEAD@{0}: commit: Add feature
def5678 HEAD@{1}: rebase: finished
ghi9012 HEAD@{2}: reset: moving to HEAD~1

# Recover "lost" commit
git checkout abc1234
# or
git reset --hard abc1234
```

### Recovering Deleted Commits
```bash
# Find the commit hash in reflog
git reflog

# Create branch from "lost" commit
git branch recovery-branch abc1234

# Cherry-pick specific commits
git cherry-pick abc1234
```

## Interactive Rebase

### Basic Usage
```bash
# Rebase last N commits
git rebase -i HEAD~5

# Rebase onto branch
git rebase -i main
```

### Commands in Editor
```
pick   abc1234 First commit     ← Keep as-is
reword def5678 Second commit    ← Change message
edit   ghi9012 Third commit     ← Stop and modify
squash jkl3456 Fourth commit    ← Merge with previous
fixup  mno7890 Fifth commit     ← Merge, discard message
drop   pqr1234 Sixth commit     ← Remove entirely
```

### Common Rebase Scenarios

**Squash Multiple Commits:**
```bash
git rebase -i HEAD~4

# In editor, change to:
pick abc1234 Main feature
squash def5678 Add tests
squash ghi9012 Fix typo
squash jkl3456 Update docs

# Result: One clean commit
```

**Reorder Commits:**
```bash
git rebase -i HEAD~3

# Simply reorder lines in editor
pick ghi9012 (was third)
pick abc1234 (was first)
pick def5678 (was second)
```

## Cherry-Pick

### Single Commit
```bash
# Copy commit to current branch
git cherry-pick abc1234

# Without committing (stage only)
git cherry-pick --no-commit abc1234

# From another branch
git cherry-pick feature-branch~2
```

### Multiple Commits
```bash
# Range of commits
git cherry-pick abc1234^..def5678

# Multiple specific commits
git cherry-pick abc1234 def5678 ghi9012

# Continue after conflict
git cherry-pick --continue

# Abort cherry-pick
git cherry-pick --abort
```

## Git Bisect

### Finding Bug Introduction
```bash
# Start bisect session
git bisect start

# Mark current as bad
git bisect bad

# Mark known good commit
git bisect good abc1234

# Git checks out middle commit
# Test and mark:
git bisect good  # if working
git bisect bad   # if broken

# Repeat until found
# Git will identify the first bad commit

# End session
git bisect reset
```

### Automated Bisect
```bash
# Run with test script
git bisect start
git bisect bad HEAD
git bisect good abc1234
git bisect run npm test

# Git automatically finds the culprit!
```

## Stash Operations

### Advanced Stash
```bash
# Stash with message
git stash push -m "Work in progress on feature"

# Stash specific files
git stash push -m "message" -- file1.txt file2.txt

# Stash including untracked
git stash push -u

# List stashes
git stash list

# Apply specific stash
git stash apply stash@{2}

# Pop and delete
git stash pop

# Create branch from stash
git stash branch new-branch stash@{0}

# Drop stash
git stash drop stash@{0}

# Clear all stashes
git stash clear
```

## History Rewriting

### Amending Commits
```bash
# Amend last commit message
git commit --amend -m "New message"

# Amend with new files
git add forgotten-file.txt
git commit --amend --no-edit

# Change author
git commit --amend --author="Name <email>"
```

### Filter-Branch (Legacy)
```bash
# Remove file from all history (DANGEROUS)
git filter-branch --tree-filter 'rm -f secret.txt' HEAD

# Change email in all commits
git filter-branch --env-filter '
if [ "$GIT_AUTHOR_EMAIL" = "old@email.com" ]
then
    export GIT_AUTHOR_EMAIL="new@email.com"
fi' -- --all
```

### Filter-Repo (Modern)
```bash
# Install first: pip install git-filter-repo

# Remove file from history
git filter-repo --path secret.txt --invert-paths

# Replace text in files
git filter-repo --replace-text replacements.txt
```

## Advanced Commands

### Worktrees
```bash
# Work on multiple branches simultaneously
git worktree add ../hotfix-branch hotfix-branch
git worktree list
git worktree remove ../hotfix-branch
```

### Submodules
```bash
# Add submodule
git submodule add https://github.com/user/repo.git

# Clone with submodules
git clone --recurse-submodules URL

# Update submodules
git submodule update --init --recursive
```

### Sparse Checkout
```bash
# Enable sparse checkout
git sparse-checkout init

# Specify directories to include
git sparse-checkout set dir1/ dir2/

# Disable
git sparse-checkout disable
```

## Command Reference

| Command | Purpose |
|---------|---------|
| `git reflog` | History of HEAD |
| `git bisect` | Binary search bugs |
| `git cherry-pick` | Copy commits |
| `git rebase -i` | Interactive rebase |
| `git stash` | Temporary storage |
| `git worktree` | Multiple checkouts |

---

*"With great power comes great responsibility - and the ability to undo mistakes."*
