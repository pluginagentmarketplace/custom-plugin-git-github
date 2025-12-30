---
description: Practice Git operations with guided exercises
allowed-tools: Read, Write, Bash
category: learning
---

# Git Practice Command

Hands-on Git exercises with immediate feedback.

## Usage

```bash
/git-practice [difficulty] [topic]
```

## Difficulty Levels

| Level | Description |
|-------|-------------|
| `easy` | Basic operations, step-by-step guidance |
| `medium` | Real scenarios, some independence |
| `hard` | Complex workflows, minimal hints |

## Topics

- `basics` - add, commit, status, log
- `branches` - create, switch, merge
- `remote` - push, pull, clone
- `rebase` - interactive rebase, squash
- `conflict` - resolve merge conflicts
- `recovery` - undo, reflog, reset

## Examples

```bash
/git-practice easy basics
/git-practice medium branches
/git-practice hard conflict
```

## Exercise Format

Each exercise includes:

1. **Scenario**: Real-world context
2. **Setup**: Initial state creation
3. **Task**: What to accomplish
4. **Hints**: Optional help
5. **Solution**: After completion
6. **Explanation**: Why it works

## Sample Exercise

### Easy: Your First Commit
```
Scenario: You've just written your first Python script.

Setup:
1. Create a new directory: my-project
2. Initialize Git
3. Create hello.py

Task:
- Stage hello.py
- Commit with message "Add hello script"
- View the commit in log

Hints:
- Use git status to check state
- Use git add to stage
- Use git commit -m "message"
```

## Response Behavior

When invoked:
1. Create safe practice environment (temp directory)
2. Set up the scenario
3. Provide clear instructions
4. Check for correct completion
5. Show solution if stuck
6. Clean up after exercise
