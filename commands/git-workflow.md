---
description: Apply Git workflows for professional development
allowed-tools: Read, Write, Edit, Bash, Grep, Glob
category: development
version: "2.0.0"
---

# Git Workflow Command

> **Production-Grade Command** | Version 2.0.0

Professional Git workflow automation for development teams.

## Usage

```bash
/git-workflow [workflow] [options]
```

## Input Validation

```yaml
parameters:
  workflow:
    type: string
    required: true
    allowed_values: [feature, hotfix, release, sync]
  name:
    type: string
    required: false
    pattern: "^[a-zA-Z0-9-_]+$"
    maxLength: 50
  options:
    dry_run: boolean
    force: boolean
    template: boolean
```

## Workflows

### Feature Development
```bash
/git-workflow feature <name>
# Creates: feature/<name> branch from main
```

### Hotfix
```bash
/git-workflow hotfix <name>
# Creates: hotfix/<name> from main
```

### Release
```bash
/git-workflow release <version>
# Creates: release/<version>
```

### Sync Fork
```bash
/git-workflow sync
# Fetches upstream, rebases main
```

## Options

| Option | Description |
|--------|-------------|
| `--dry-run` | Show commands without executing |
| `--force` | Skip confirmation prompts |
| `--template` | Use PR/commit templates |

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Workflow completed |
| 1 | Invalid workflow |
| 2 | Git state error |
| 3 | Remote operation failed |

## Workflow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 FEATURE WORKFLOW                            │
├─────────────────────────────────────────────────────────────┤
│  1. /git-workflow feature login                             │
│     ├─► git checkout main                                   │
│     ├─► git pull origin main                                │
│     ├─► git checkout -b feature/login                       │
│     └─► git push -u origin feature/login                    │
│                                                             │
│  2. [Development & Commits]                                 │
│  3. gh pr create --template                                 │
│  4. [Review & Merge]                                        │
│  5. git checkout main && git pull                           │
│     └─► git branch -d feature/login                         │
└─────────────────────────────────────────────────────────────┘
```

## Pre-flight Checks

```yaml
checks:
  - verify_git_repo
  - verify_clean_working_tree
  - verify_remote_configured
```

## Error Handling

```yaml
fallback:
  - trigger: uncommitted_changes
    action: suggest_stash_or_commit
  - trigger: branch_exists
    action: suggest_different_name
```

## Integration

Works with:
- GitHub CLI for PR creation
- Conventional commits
- Branch naming conventions
