#!/usr/bin/env bash
# Test: Make target integration test
# File: tests/ghostty/test_make_integration.sh
# Purpose: Tests that 'make link' includes ghostty configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Testing Make target integration..."

# Check if Makefile exists
if [[ ! -f "Makefile" ]]; then
    echo -e "${RED}FAIL${NC}: Makefile not found in current directory"
    exit 1
fi

# Check if ghostty is in DFS_CONFIG
if ! grep -q "DFS_CONFIG.*ghostty" Makefile; then
    echo -e "${RED}FAIL${NC}: 'ghostty' not found in DFS_CONFIG variable"
    echo "Current DFS_CONFIG:"
    grep "DFS_CONFIG" Makefile || echo "DFS_CONFIG not found"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found 'ghostty' in DFS_CONFIG variable"

# Test that make link-to-config-ghostty target is available
echo "Testing make link-to-config-ghostty target..."
if make -n link-to-config-ghostty 2>/dev/null; then
    echo -e "${GREEN}✓${NC} make link-to-config-ghostty target is available"
else
    echo -e "${RED}FAIL${NC}: make link-to-config-ghostty target not available"
    exit 1
fi

# Test that make link includes ghostty (dry run)
echo "Testing that 'make link' includes ghostty configuration..."
LINK_OUTPUT=$(make -n link 2>&1)
if echo "$LINK_OUTPUT" | grep -q "ghostty"; then
    echo -e "${GREEN}✓${NC} 'make link' includes ghostty configuration"
else
    echo -e "${RED}FAIL${NC}: 'make link' does not include ghostty configuration"
    echo "Make link output:"
    echo "$LINK_OUTPUT"
    exit 1
fi

# Check for expected symlink creation in output
if echo "$LINK_OUTPUT" | grep -q "\.config/ghostty"; then
    echo -e "${GREEN}✓${NC} link-to-config target includes ghostty"
else
    echo -e "${RED}FAIL${NC}: link-to-config target does not include ghostty"
    echo "Make link output:"
    echo "$LINK_OUTPUT"
    exit 1
fi

echo -e "${GREEN}PASS${NC}: Make target integration test successful"
exit 0