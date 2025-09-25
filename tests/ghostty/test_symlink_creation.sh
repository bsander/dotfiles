#!/usr/bin/env bash
# Test: Symlink creation test
# File: tests/ghostty/test_symlink_creation.sh
# Purpose: Verifies symlink from dotfiles/ghostty to ~/.config/ghostty

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Testing Ghostty symlink creation..."

# Expected paths
SOURCE_DIR="$(pwd)/ghostty"
TARGET_DIR="$HOME/.config/ghostty"

# Check if source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo -e "${RED}FAIL${NC}: Source directory does not exist at $SOURCE_DIR"
    exit 1
fi

# Test Make target (this should create the symlink)
echo "Running 'make link-to-config-ghostty'..."
if make link-to-config-ghostty; then
    echo "Make target executed successfully"
else
    echo -e "${RED}FAIL${NC}: Make target failed"
    exit 1
fi

# Check if symlink was created
if [[ ! -L "$TARGET_DIR" ]]; then
    echo -e "${RED}FAIL${NC}: Symlink not created at $TARGET_DIR"
    exit 1
fi

# Check if symlink points to correct location
LINK_TARGET=$(readlink "$TARGET_DIR")
if [[ "$LINK_TARGET" != "$SOURCE_DIR" ]]; then
    echo -e "${RED}FAIL${NC}: Symlink points to $LINK_TARGET, expected $SOURCE_DIR"
    exit 1
fi

# Check if symlinked directory is accessible
if [[ ! -d "$TARGET_DIR" ]]; then
    echo -e "${RED}FAIL${NC}: Symlinked directory is not accessible"
    exit 1
fi

echo -e "${GREEN}PASS${NC}: Symlink created successfully and points to correct location"
exit 0