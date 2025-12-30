---
description: Apply Git workflows for professional development
allowed-tools: Read, Write, Edit, Bash, Grep, Glob
category: development
---

# Git Workflow Command

Professional Git workflow automation for development teams.

## Usage

```bash
/git-workflow [workflow] [options]
```

## Workflows

### Feature Development
```bash
/git-workflow feature <name>

# Creates: feature/<name> branch from main
# Sets upstream
# Provides PR template
```

### Hotfix
```bash
/git-workflow hotfix <name>

# Creates: hotfix/<name> from main
# Fast-track process
# Tags for release
```

### Release
```bash
/git-workflow release <version>

# Creates: release/<version>
# Generates changelog
# Prepares for deployment
```

### Sync Fork
```bash
/git-workflow sync

# Fetches upstream
# Rebases main
# Updates fork
```

## Options

| Option | Description |
|--------|-------------|
| `--dry-run` | Show commands without executing |
| `--force` | Skip confirmation prompts |
| `--template` | Use PR/commit templates |

## Examples

```bash
/git-workflow feature user-auth
/git-workflow hotfix security-patch
/git-workflow release 2.1.0
/git-workflow sync
```

## Response Behavior

When invoked:
1. Validate current Git state
2. Check for uncommitted changes
3. Execute workflow steps
4. Provide next action guidance
5. Generate relevant templates

## Workflow: Feature Development

```
┌─────────────────────────────────────────────────────────────┐
│                 FEATURE WORKFLOW                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. /git-workflow feature login                             │
│     ├─► git checkout main                                   │
│     ├─► git pull origin main                                │
│     ├─► git checkout -b feature/login                       │
│     └─► git push -u origin feature/login                    │
│                                                             │
│  2. [Development & Commits]                                 │
│                                                             │
│  3. gh pr create --template                                 │
│                                                             │
│  4. [Review & Merge]                                        │
│                                                             │
│  5. git checkout main && git pull                           │
│     └─► git branch -d feature/login                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Integration

Works with:
- GitHub CLI for PR creation
- Conventional commits
- Branch naming conventions
- Team workflow standards
