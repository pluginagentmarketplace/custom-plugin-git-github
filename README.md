# Git & GitHub Mastery System

[![SASMP v1.3.0](https://img.shields.io/badge/SASMP-v1.3.0-blue.svg)](https://github.com/pluginagentmarketplace)
[![Git](https://img.shields.io/badge/Git-2.x-orange?logo=git)](https://git-scm.com)
[![GitHub](https://img.shields.io/badge/GitHub-CLI-black?logo=github)](https://cli.github.com)
[![Plugin Type](https://img.shields.io/badge/Type-Hybrid-purple.svg)](https://github.com/pluginagentmarketplace)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**Complete Git & GitHub Mastery System** - Learn AND Develop with expert AI agents. Master version control from basics to advanced workflows.

## Plugin Type: HYBRID

This plugin serves **two purposes**:

| Mode | Purpose | For Who |
|------|---------|---------|
| **Learning** | Understand Git concepts | Beginners, Students |
| **Development** | Professional Git workflows | Developers, Teams |

---

## Features Overview

| Category | Count | Items |
|----------|-------|-------|
| **Agents** | 3 | 1 Learning + 2 Development |
| **Skills** | 7 | 3 Learning + 4 Development |
| **Commands** | 4 | 2 Learning + 2 Development |

---

## Learning Mode

### Learning Agent

| Agent | Expertise |
|-------|-----------|
| `git-mentor` | Patient Git teaching with visual explanations |

### Learning Commands

```bash
/git-learn basics       # Learn Git fundamentals
/git-learn branching    # Understand branches
/git-practice easy      # Beginner exercises
/git-practice medium    # Intermediate challenges
```

### Learning Skills

- **git-intro** - What is Git, installation, first steps
- **git-basics** - Core commands (init, add, commit, status, log)
- **basic-workflow** - Daily add-commit-push cycle

---

## Development Mode

### Development Agents

| Agent | Purpose |
|-------|---------|
| `git-expert` | Advanced Git operations, rebasing, history |
| `github-specialist` | PRs, Actions, Issues, platform features |

### Development Commands

| Command | Description |
|---------|-------------|
| `/git-help` | Git command assistance |
| `/git-workflow feature <name>` | Create feature branch |
| `/git-workflow hotfix <name>` | Create hotfix branch |
| `/git-workflow release <ver>` | Prepare release |

### Development Skills

- **branching** - GitFlow, GitHub Flow, trunk-based dev
- **collaboration** - Remote repos, team workflows
- **advanced-git** - Rebase, cherry-pick, bisect, reflog
- **github-features** - PRs, Actions, Issues, Pages

---

## Plugin Structure

```
custom-plugin-git-github/
├── agents/
│   ├── git-mentor.md          # Learning
│   ├── git-expert.md          # Development
│   └── github-specialist.md   # Development
├── skills/
│   ├── git-intro/             # Learning
│   │   ├── SKILL.md
│   │   ├── assets/
│   │   ├── scripts/
│   │   └── references/
│   ├── git-basics/            # Learning
│   ├── basic-workflow/        # Learning
│   ├── branching/             # Development
│   ├── collaboration/         # Development
│   ├── advanced-git/          # Development
│   └── github-features/       # Development
├── commands/
│   ├── git-help.md            # Development
│   ├── git-learn.md           # Learning
│   ├── git-practice.md        # Learning
│   └── git-workflow.md        # Development
├── hooks/
│   └── hooks.json
└── .claude-plugin/
    ├── plugin.json
    └── marketplace.json
```

---

## Topics Covered

### Learning Path
```
1. Git Introduction
   └── What is Git? Why use it?
       └── Installation & Setup

2. Basic Operations
   └── init, add, commit, status, log
       └── The Three Areas

3. Daily Workflow
   └── pull, work, add, commit, push
       └── Commit Messages
```

### Development Topics
```
1. Branching Strategies
   ├── GitFlow
   ├── GitHub Flow
   └── Trunk-Based Development

2. Collaboration
   ├── Remotes & Forks
   ├── Pull Requests
   └── Code Review

3. Advanced Operations
   ├── Interactive Rebase
   ├── Cherry-Pick
   ├── Bisect
   └── Reflog Recovery

4. GitHub Platform
   ├── Actions CI/CD
   ├── Issues & Projects
   ├── Branch Protection
   └── Releases
```

---

## Installation

```bash
# Via Claude Code plugin marketplace
/plugin add marketplace pluginagentmarketplace/custom-plugin-git-github
/plugin install custom-plugin-git-github@pluginagentmarketplace-git-github
```

---

## Usage Examples

### Learning Flow
```bash
# 1. Start with introduction
/git-learn basics

# 2. Practice basic operations
/git-practice easy basics

# 3. Learn branching
/git-learn branching

# 4. Practice with scenarios
/git-practice medium branches
```

### Development Flow
```bash
# 1. Start feature
/git-workflow feature user-auth

# 2. Get Git help
/git-help

# 3. Advanced operations
Ask git-expert: "How do I squash my last 3 commits?"

# 4. GitHub assistance
Ask github-specialist: "Create a GitHub Action for testing"
```

---

## Quick Reference

### Essential Git Commands
```bash
# Basic
git init                    # Start tracking
git status                  # Check state
git add <file>             # Stage changes
git commit -m "msg"        # Save changes
git log --oneline          # View history

# Branching
git branch                  # List branches
git checkout -b <name>      # Create & switch
git merge <branch>          # Combine branches

# Remote
git clone <url>            # Download repo
git pull                    # Get latest
git push                    # Share changes
```

### Essential GitHub CLI
```bash
# Authenticate
gh auth login

# Pull Requests
gh pr create --title "Title"
gh pr list
gh pr merge 123 --squash

# Issues
gh issue create --title "Bug"
gh issue list
```

---

## Version History

| Version | Date | Type | Changes |
|---------|------|------|---------|
| 2.0.0 | 2025-12-29 | Hybrid | Merged with beginner plugin, added learning mode |
| 1.0.0 | 2025-12-29 | Development | Initial release with 2 agents, 5 skills |

---

## Related Resources

- [Pro Git Book](https://git-scm.com/book/en/v2)
- [GitHub Docs](https://docs.github.com)
- [GitHub CLI Manual](https://cli.github.com/manual/)
- [Learn Git Branching](https://learngitbranching.js.org/)

---

## License

MIT License - See [LICENSE](LICENSE) for details.

## Author

Plugin Agent Marketplace - [pluginagentmarketplace@gmail.com](mailto:pluginagentmarketplace@gmail.com)
