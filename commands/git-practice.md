---
description: Practice Git operations with guided exercises
allowed-tools: Read, Write, Bash
category: learning
version: "2.0.0"
---

# Git Practice Command

> **Production-Grade Command** | Version 2.0.0

Hands-on Git exercises with immediate feedback.

## Usage

```bash
/git-practice [difficulty] [topic]
```

## Input Validation

```yaml
parameters:
  difficulty:
    type: string
    required: false
    default: easy
    allowed_values: [easy, medium, hard]
  topic:
    type: string
    required: false
    default: basics
    allowed_values: [basics, branches, remote, rebase, conflict, recovery]
```

## Difficulty Levels

| Level | Description | Guidance |
|-------|-------------|----------|
| `easy` | Basic operations | Step-by-step |
| `medium` | Real scenarios | Some hints |
| `hard` | Complex workflows | Minimal hints |

## Topics

| Topic | Skills |
|-------|--------|
| `basics` | add, commit, status, log |
| `branches` | create, switch, merge |
| `remote` | push, pull, clone |
| `rebase` | interactive rebase, squash |
| `conflict` | resolve merge conflicts |
| `recovery` | undo, reflog, reset |

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Completed |
| 1 | Invalid parameters |
| 2 | Exercise failed |

## Exercise Format

1. **Scenario**: Real-world context
2. **Setup**: Initial state creation
3. **Task**: What to accomplish
4. **Hints**: Optional help
5. **Solution**: After completion
6. **Explanation**: Why it works

## Safety

```yaml
safety:
  - create_temp_directory: true
  - cleanup_after_exercise: true
  - never_modify_real_repos: true
```

## Error Handling

```yaml
fallback:
  - trigger: exercise_failed
    action: show_solution_with_explanation
```
