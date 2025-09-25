#!/usr/bin/env bash
# Simple Ghostty configuration verification script
# File: bin/verify-ghostty-config-simple.sh
# Purpose: Quick verification of Ghostty setup per quickstart guide

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Ghostty Configuration Verification${NC}"
echo "=================================="

# Test 1: Configuration symlink
echo -n "1. Configuration symlink... "
if [[ -L "$HOME/.config/ghostty" && -d "$HOME/.config/ghostty" ]]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
fi

# Test 2: Configuration file exists
echo -n "2. Configuration file exists... "
if [[ -f "$HOME/.config/ghostty/config" ]]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
fi

# Test 3: Font configuration
echo -n "3. Font configuration... "
if grep -q "font-family.*Monaspice Nerd Font Mono" "$HOME/.config/ghostty/config"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
fi

# Test 4: Focus-follows-mouse
echo -n "4. Focus-follows-mouse enabled... "
if grep -q "focus-follows-mouse.*true" "$HOME/.config/ghostty/config"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
fi

# Test 5: Keybindings
echo -n "5. Keybindings configured... "
KEYBIND_COUNT=$(grep -c "keybind.*=" "$HOME/.config/ghostty/config" || echo "0")
if [[ $KEYBIND_COUNT -gt 10 ]]; then
    echo -e "${GREEN}PASS${NC} ($KEYBIND_COUNT keybindings)"
else
    echo -e "${RED}FAIL${NC} (only $KEYBIND_COUNT keybindings found)"
fi

# Test 6: Make integration
echo -n "6. Make integration... "
if make -n link 2>/dev/null | grep -q "\.config/ghostty"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
fi

# Test 7: Font availability
echo -n "7. Font availability... "
if command -v fc-list &> /dev/null && fc-list | grep -qi "monaspice.*nerd.*font.*mono"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${YELLOW}SKIP${NC} (install: brew install font-monaspace-nerd-font)"
fi

echo -e "\n${BLUE}Manual Tests Recommended:${NC}"
echo "• Launch Ghostty and verify font appearance"
echo "• Test focus-follows-mouse behavior"
echo "• Test keyboard shortcuts (Ctrl+Shift+T, Alt+1, etc.)"
echo "• Create splits and test development workflow"

echo -e "\n${GREEN}Configuration verification complete!${NC}"