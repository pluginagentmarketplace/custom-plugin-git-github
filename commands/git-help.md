---
description: Get help with Git and GitHub commands
allowed-tools: Read, Bash
category: development
version: "2.0.0"
---

# Git Help Command

> **Production-Grade Command** | Version 2.0.0

Provides guidance on Git and GitHub operations.

## Usage

```bash
/git-help [topic]
```

## Input Validation

```yaml
parameters:
  topic:
    type: string
    required: false
    default: overview
    allowed_values: [overview, commands, workflow, troubleshoot, github]
```

## Topics

| Topic | Description |
|-------|-------------|
| `overview` | General Git help |
| `commands` | Command reference |
| `workflow` | Workflow guidance |
| `troubleshoot` | Debug common issues |
| `github` | GitHub CLI help |

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Invalid topic |

## Response Behavior

When invoked, help with:
- Git command syntax and examples
- GitHub CLI usage patterns
- Workflow recommendations
- Troubleshooting common issues

## Error Handling

```yaml
fallback:
  - trigger: unknown_topic
    action: show_available_topics
```
