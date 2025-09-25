#!/usr/bin/env bash
# Test: Keybinding validation test
# File: tests/ghostty/test_keybinding_validation.sh
# Purpose: Validates keybinding syntax and checks for duplicates

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Testing Ghostty keybinding validation..."

# Test configuration file path
CONFIG_FILE="$(pwd)/ghostty/config"

# Check if configuration file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo -e "${RED}FAIL${NC}: Configuration file does not exist at $CONFIG_FILE"
    exit 1
fi

# Extract all keybind lines (excluding comments)
KEYBIND_LINES=$(grep -v "^[[:space:]]*#" "$CONFIG_FILE" | grep "keybind" || true)

if [[ -z "$KEYBIND_LINES" ]]; then
    echo -e "${RED}FAIL${NC}: No keybind configurations found"
    exit 1
fi

echo "Found keybind configurations:"
echo "$KEYBIND_LINES"

# Check for required chorded shortcuts (Ctrl+Shift combinations)
REQUIRED_CHORDED=(
    "ctrl+shift+n"
    "ctrl+shift+w"
    "ctrl+shift+t"
    "ctrl+shift+d"
    "ctrl+shift+s"
)

echo "Checking for required chorded shortcuts..."
for shortcut in "${REQUIRED_CHORDED[@]}"; do
    if echo "$KEYBIND_LINES" | grep -q "$shortcut"; then
        echo -e "${GREEN}✓${NC} Found: $shortcut"
    else
        echo -e "${RED}✗${NC} Missing: $shortcut"
        exit 1
    fi
done

# Check for required alt-based shortcuts
REQUIRED_ALT=(
    "alt+1"
    "alt+2"
    "alt+h"
    "alt+l"
    "alt+c"
    "alt+v"
)

echo "Checking for required alt-based shortcuts..."
for shortcut in "${REQUIRED_ALT[@]}"; do
    if echo "$KEYBIND_LINES" | grep -q "$shortcut"; then
        echo -e "${GREEN}✓${NC} Found: $shortcut"
    else
        echo -e "${RED}✗${NC} Missing: $shortcut"
        exit 1
    fi
done

# Check for duplicate keybindings
echo "Checking for duplicate keybindings..."
KEYS=$(echo "$KEYBIND_LINES" | sed 's/keybind[[:space:]]*=[[:space:]]*\([^=]*\)=.*/\1/' | sort)
UNIQUE_KEYS=$(echo "$KEYS" | sort -u)

if [[ $(echo "$KEYS" | wc -l) -ne $(echo "$UNIQUE_KEYS" | wc -l) ]]; then
    echo -e "${RED}FAIL${NC}: Duplicate keybindings detected"
    echo "Duplicates:"
    echo "$KEYS" | sort | uniq -d
    exit 1
fi

# Validate keybinding syntax format
echo "Validating keybinding syntax format..."
while IFS= read -r line; do
    if [[ -n "$line" ]] && ! echo "$line" | grep -q "keybind[[:space:]]*=[[:space:]]*[^=]*=[^=]*"; then
        echo -e "${RED}FAIL${NC}: Invalid keybinding syntax: $line"
        echo "Expected format: keybind = modifier+key=action"
        exit 1
    fi
done <<< "$KEYBIND_LINES"

echo -e "${GREEN}PASS${NC}: All keybinding validations successful"
exit 0