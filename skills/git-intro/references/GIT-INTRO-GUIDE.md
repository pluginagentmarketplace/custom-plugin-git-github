# Git Introduction Reference Guide

## Mental Models for Git

### The Snapshot Model
Git doesn't store differences - it stores complete snapshots of your files at each commit.

```
Commit 1: [file_a v1] [file_b v1]
              ↓
Commit 2: [file_a v2] [file_b v1] ← Only file_a changed
              ↓
Commit 3: [file_a v2] [file_b v2] ← Only file_b changed
```

### The Timeline Model
```
Past ←──────────────────────────────────────→ Future

●────●────●────●────●────●
1    2    3    4    5    6 (HEAD)
                          ↑
                     You are here
```

### The Tree Model
```
                    ● main (stable)
                   /
●────●────●────●────●
                    \
                     ● feature (experimental)
```

## Key Terminology

| Term | Plain English |
|------|---------------|
| **Repository (repo)** | A folder tracked by Git |
| **Commit** | A saved snapshot |
| **Branch** | A separate line of development |
| **HEAD** | Where you are now |
| **Working Directory** | Your actual files |
| **Staging Area (Index)** | Changes ready to commit |
| **Remote** | A copy on another computer (like GitHub) |

## Common Misconceptions

### Myth: "Git is just backup"
**Reality:** Git tracks HISTORY, not just copies. You can see who changed what, when, and why.

### Myth: "Commits are expensive"
**Reality:** Commits are cheap! Make them often. Each commit should be one logical change.

### Myth: "I can't undo mistakes"
**Reality:** Almost everything in Git is recoverable. `git reflog` is your friend.

### Myth: "Git is only for code"
**Reality:** Git works for any text files: documentation, configs, even this guide!

## The Git Workflow Visualized

```
   YOU        STAGING         LOCAL           REMOTE
  (work)       AREA           REPO            (GitHub)
    │            │              │                │
    │ git add    │              │                │
    ├───────────►│              │                │
    │            │ git commit   │                │
    │            ├─────────────►│                │
    │            │              │  git push      │
    │            │              ├───────────────►│
    │            │              │                │
    │            │              │  git fetch     │
    │            │              │◄───────────────┤
    │            │  git merge   │                │
    │            │◄─────────────┤                │
    │ changes    │              │                │
    │◄───────────┤              │                │
```

## Best Practices for Beginners

### 1. Commit Often
```bash
# Bad: One giant commit after days of work
git commit -m "Did a bunch of stuff"

# Good: Small, focused commits
git commit -m "Add user login form"
git commit -m "Add form validation"
git commit -m "Add error messages"
```

### 2. Write Good Messages
```bash
# Bad
git commit -m "fix"
git commit -m "updates"
git commit -m "asdf"

# Good
git commit -m "Fix login button not responding on mobile"
git commit -m "Update README with installation steps"
git commit -m "Add dark mode toggle to settings"
```

### 3. Check Before Committing
```bash
# Always do this first!
git status        # What's staged?
git diff          # What changed in files?
git diff --staged # What's about to be committed?
```

### 4. Use .gitignore
```bash
# .gitignore file
node_modules/
.env
*.log
.DS_Store
```

## Troubleshooting Common Issues

### "I committed to the wrong branch!"
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Switch to correct branch
git checkout correct-branch

# Re-commit
git commit -m "Your message"
```

### "I want to undo my last commit"
```bash
# Keep changes, just undo commit
git reset --soft HEAD~1

# Undo commit AND changes (DANGEROUS)
git reset --hard HEAD~1
```

### "I committed something I shouldn't have"
```bash
# Remove file from staging but keep in working directory
git reset HEAD <file>

# Remove from last commit
git reset --soft HEAD~1
git reset HEAD <file>
git commit -m "Message"
```

## External Resources

- [Pro Git Book (Free)](https://git-scm.com/book/en/v2)
- [Git Visual Reference](https://marklodato.github.io/visual-git-guide/index-en.html)
- [Learn Git Branching (Interactive)](https://learngitbranching.js.org/)
- [Oh Shit, Git!?!](https://ohshitgit.com/)

---

*Last Updated: 2025-12-29*
