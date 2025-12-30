#!/bin/bash
# Git Commit Helper Script
# Guides users through creating a proper commit

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}=== Git Commit Helper ===${NC}"
echo ""

# Check if in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: Not in a Git repository!${NC}"
    exit 1
fi

# Check if there are staged changes
STAGED=$(git diff --cached --name-only)
if [ -z "$STAGED" ]; then
    echo -e "${YELLOW}No staged changes found.${NC}"
    echo ""
    echo "Would you like to stage all changes? (y/n)"
    read -r STAGE_ALL
    if [ "$STAGE_ALL" = "y" ]; then
        git add .
        STAGED=$(git diff --cached --name-only)
        if [ -z "$STAGED" ]; then
            echo -e "${RED}No changes to commit.${NC}"
            exit 1
        fi
    else
        echo "Use 'git add <files>' to stage changes first."
        exit 0
    fi
fi

# Show staged files
echo -e "${GREEN}Staged files:${NC}"
echo "$STAGED" | while read -r file; do
    echo "  + $file"
done
echo ""

# Commit type selection
echo -e "${CYAN}Select commit type:${NC}"
echo "1) feat     - New feature"
echo "2) fix      - Bug fix"
echo "3) docs     - Documentation"
echo "4) style    - Formatting"
echo "5) refactor - Code restructure"
echo "6) test     - Tests"
echo "7) chore    - Maintenance"
echo ""
read -p "Enter number (1-7): " TYPE_NUM

case $TYPE_NUM in
    1) TYPE="feat" ;;
    2) TYPE="fix" ;;
    3) TYPE="docs" ;;
    4) TYPE="style" ;;
    5) TYPE="refactor" ;;
    6) TYPE="test" ;;
    7) TYPE="chore" ;;
    *) echo -e "${RED}Invalid selection${NC}"; exit 1 ;;
esac

# Optional scope
echo ""
read -p "Enter scope (optional, e.g., auth, ui, api): " SCOPE

# Subject line
echo ""
echo -e "${CYAN}Enter commit subject (max 50 chars):${NC}"
echo "Tip: Use imperative mood (Add, Fix, Update, not Added, Fixed, Updated)"
read -p "> " SUBJECT

# Validate subject length
if [ ${#SUBJECT} -gt 50 ]; then
    echo -e "${YELLOW}Warning: Subject is ${#SUBJECT} chars (recommended max: 50)${NC}"
fi

# Build commit message
if [ -n "$SCOPE" ]; then
    COMMIT_MSG="$TYPE($SCOPE): $SUBJECT"
else
    COMMIT_MSG="$TYPE: $SUBJECT"
fi

# Optional body
echo ""
echo "Add detailed description? (y/n)"
read -r ADD_BODY
if [ "$ADD_BODY" = "y" ]; then
    echo "Enter description (press Ctrl+D when done):"
    BODY=$(cat)
    COMMIT_MSG="$COMMIT_MSG

$BODY"
fi

# Show preview
echo ""
echo -e "${BLUE}=== Commit Preview ===${NC}"
echo "$COMMIT_MSG"
echo -e "${BLUE}======================${NC}"
echo ""

# Confirm
read -p "Proceed with commit? (y/n): " CONFIRM
if [ "$CONFIRM" = "y" ]; then
    git commit -m "$COMMIT_MSG"
    echo ""
    echo -e "${GREEN}Commit successful!${NC}"
    echo ""
    echo "Latest commit:"
    git log -1 --oneline
    echo ""
    echo "To push: git push"
else
    echo "Commit cancelled."
fi
