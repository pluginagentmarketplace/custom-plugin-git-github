#!/bin/bash
# Git Setup Verification Script
# Checks if Git is properly installed and configured

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Git Setup Verification ===${NC}"
echo ""

# Check 1: Git installed?
echo -n "Checking Git installation... "
if command -v git &> /dev/null; then
    VERSION=$(git --version)
    echo -e "${GREEN}OK${NC} - $VERSION"
else
    echo -e "${RED}FAIL${NC} - Git is not installed!"
    echo "Please install Git first. See SKILL.md for instructions."
    exit 1
fi

# Check 2: User name configured?
echo -n "Checking user.name... "
USER_NAME=$(git config --global user.name 2>/dev/null || echo "")
if [ -n "$USER_NAME" ]; then
    echo -e "${GREEN}OK${NC} - $USER_NAME"
else
    echo -e "${YELLOW}WARN${NC} - Not configured!"
    echo "  Run: git config --global user.name \"Your Name\""
fi

# Check 3: Email configured?
echo -n "Checking user.email... "
USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "")
if [ -n "$USER_EMAIL" ]; then
    echo -e "${GREEN}OK${NC} - $USER_EMAIL"
else
    echo -e "${YELLOW}WARN${NC} - Not configured!"
    echo "  Run: git config --global user.email \"your.email@example.com\""
fi

# Check 4: Default branch
echo -n "Checking default branch... "
DEFAULT_BRANCH=$(git config --global init.defaultBranch 2>/dev/null || echo "")
if [ -n "$DEFAULT_BRANCH" ]; then
    echo -e "${GREEN}OK${NC} - $DEFAULT_BRANCH"
else
    echo -e "${YELLOW}INFO${NC} - Using system default (likely 'master')"
    echo "  Recommend: git config --global init.defaultBranch main"
fi

# Check 5: Editor configured?
echo -n "Checking editor... "
EDITOR=$(git config --global core.editor 2>/dev/null || echo "")
if [ -n "$EDITOR" ]; then
    echo -e "${GREEN}OK${NC} - $EDITOR"
else
    echo -e "${YELLOW}INFO${NC} - Using system default"
fi

# Summary
echo ""
echo -e "${BLUE}=== Summary ===${NC}"

if [ -n "$USER_NAME" ] && [ -n "$USER_EMAIL" ]; then
    echo -e "${GREEN}Git is ready to use!${NC}"
    echo ""
    echo "Quick test: Try creating your first repo with:"
    echo "  mkdir test-repo && cd test-repo"
    echo "  git init"
    echo "  echo '# Test' > README.md"
    echo "  git add README.md"
    echo "  git commit -m 'Initial commit'"
else
    echo -e "${YELLOW}Git needs configuration before use.${NC}"
    echo "Please set user.name and user.email first."
fi

echo ""
echo "Full configuration:"
echo "---"
git config --global --list 2>/dev/null || echo "No global config found"
