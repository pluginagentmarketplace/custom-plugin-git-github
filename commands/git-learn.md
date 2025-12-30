---
description: Learn Git concepts with interactive explanations and examples
allowed-tools: Read, Bash
category: learning
version: "2.0.0"
---

# Git Learn Command

> **Production-Grade Command** | Version 2.0.0

Interactive learning command for Git concepts.

## Usage

```bash
/git-learn [topic]
```

## Input Validation

```yaml
parameters:
  topic:
    type: string
    required: false
    default: basics
    validation: [lowercase, trim]
    allowed_values:
      - basics
      - workflow
      - branching
      - remote
      - merge
      - rebase
      - conflict
      - stash
      - reflog
      - bisect
      - cherry-pick
      - submodules
```

## Topics by Level

### Beginner
- `basics` - Git fundamentals (init, add, commit)
- `workflow` - Daily Git workflow
- `branching` - Working with branches
- `remote` - Push, pull, clone operations

### Intermediate
- `merge` - Merging strategies
- `rebase` - Rebasing workflows
- `conflict` - Conflict resolution
- `stash` - Temporary storage

### Advanced
- `reflog` - History recovery
- `bisect` - Bug hunting
- `cherry-pick` - Selective commits
- `submodules` - Nested repositories

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Unknown topic |

## Response Format

When invoked, provide:
1. Concept explanation with ASCII diagrams
2. Real-world analogy
3. Command examples
4. Common mistakes to avoid
5. Practice exercises

## Teaching Style

- Use ELI5 (Explain Like I'm Five) approach
- Include visual diagrams
- Provide hands-on exercises
- Show before/after states
- Highlight common pitfalls

## Error Handling

```yaml
fallback:
  - trigger: unknown_topic
    action: suggest_similar_topics
```
