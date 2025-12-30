---
name: github-features
description: GitHub platform features - PRs, issues, actions, projects, and automation
sasmp_version: "1.3.0"
bonded_agent: github-specialist
bond_type: PRIMARY_BOND
category: development
version: "1.0.0"
triggers:
  - github features
  - pull request
  - github actions
  - github issues
---

# GitHub Features Skill

**Leveraging GitHub platform capabilities.**

## GitHub CLI (`gh`)

### Installation & Auth
```bash
# Install
brew install gh        # macOS
winget install GitHub.cli  # Windows

# Authenticate
gh auth login
gh auth status
```

### Essential Commands
```bash
# Repository
gh repo create name --public
gh repo clone owner/repo
gh repo view owner/repo --web

# Pull Requests
gh pr create --title "Title" --body "Body"
gh pr list
gh pr view 123
gh pr checkout 123
gh pr merge 123 --squash
gh pr close 123

# Issues
gh issue create --title "Bug" --body "Description"
gh issue list --state open
gh issue view 123
gh issue close 123

# Actions
gh run list
gh run view 123
gh run watch 123
gh workflow run ci.yml
```

## Pull Requests

### Creating Effective PRs
```markdown
## Description
Brief summary of changes

## Changes
- Added user authentication
- Updated login form
- Fixed session handling

## Testing
- [ ] Unit tests pass
- [ ] Manual testing completed
- [ ] No regressions

## Related Issues
Closes #123
```

### PR Best Practices

| Practice | Description |
|----------|-------------|
| Small PRs | < 400 lines ideal |
| Clear title | Type: Description |
| Screenshots | For UI changes |
| Tests | Include with feature |
| Documentation | Update if needed |

### PR Templates
```markdown
<!-- .github/pull_request_template.md -->
## Summary
<!-- What does this PR do? -->

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
<!-- How has this been tested? -->

## Checklist
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No new warnings
```

## GitHub Actions

### Basic Workflow
```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'

      - run: npm ci
      - run: npm test
      - run: npm run build
```

### Matrix Strategy
```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        node: [18, 20, 22]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm test
```

### Secrets & Variables
```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: deploy.sh
        env:
          API_KEY: ${{ secrets.API_KEY }}
          DEPLOY_ENV: ${{ vars.DEPLOY_ENV }}
```

## Issues

### Issue Templates
```yaml
# .github/ISSUE_TEMPLATE/bug_report.yml
name: Bug Report
description: Report a bug
labels: [bug]
body:
  - type: textarea
    id: description
    attributes:
      label: Describe the bug
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: Steps to reproduce

  - type: dropdown
    id: severity
    attributes:
      label: Severity
      options:
        - Critical
        - Major
        - Minor
```

### Labels Strategy
```
Type:       bug, feature, docs, chore
Priority:   P0 (critical), P1 (high), P2 (medium), P3 (low)
Status:     backlog, in-progress, review, done
Area:       frontend, backend, infra, ci
```

## Branch Protection

### Settings
```yaml
# Required settings for main branch
protection_rules:
  - require_pull_request_reviews:
      required_approving_review_count: 2
  - require_status_checks:
      strict: true
      contexts: [ci, lint, test]
  - require_conversation_resolution: true
  - require_signed_commits: true
  - restrict_pushes: true
  - allow_force_pushes: false
  - allow_deletions: false
```

## CODEOWNERS

```
# .github/CODEOWNERS
# Default owners
* @org/core-team

# Frontend
*.js @org/frontend-team
*.tsx @org/frontend-team
/src/components/ @org/frontend-team

# Backend
*.py @org/backend-team
/api/ @org/backend-team

# DevOps
Dockerfile @org/devops-team
*.yml @org/devops-team
```

## Dependabot

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 5
    reviewers:
      - "@org/frontend-team"

  - package-ecosystem: "pip"
    directory: "/backend"
    schedule:
      interval: "weekly"
```

## GitHub Pages

### Deployment Workflow
```yaml
# .github/workflows/pages.yml
name: Deploy to Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci && npm run build
      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist
      - uses: actions/deploy-pages@v4
        id: deployment
```

## Releases

### Creating Releases
```bash
# Via CLI
gh release create v1.0.0 --title "Release 1.0.0" --notes "First release"

# With auto-generated notes
gh release create v1.0.0 --generate-notes

# Upload assets
gh release upload v1.0.0 ./dist/app.zip
```

### Release Automation
```yaml
# .github/workflows/release.yml
on:
  push:
    tags: ['v*']

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: softprops/action-gh-release@v1
        with:
          generate_release_notes: true
```

## GitHub Features Matrix

| Feature | Purpose |
|---------|---------|
| Actions | CI/CD automation |
| Pages | Static site hosting |
| Projects | Kanban planning |
| Discussions | Community Q&A |
| Wiki | Documentation |
| Releases | Distribution |
| Packages | Container registry |
| Codespaces | Cloud IDE |

---

*"GitHub is not just hosting - it's a complete development platform."*
