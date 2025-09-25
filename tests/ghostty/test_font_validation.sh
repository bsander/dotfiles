#!/usr/bin/env bash
# Test: Font configuration validation test
# File: tests/ghostty/test_font_validation.sh
# Purpose: Verifies Monaspice Nerd Font Mono is specified in configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Testing Ghostty font configuration validation..."

# Test configuration file path
CONFIG_FILE="$(pwd)/ghostty/config"

# Check if configuration file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo -e "${RED}FAIL${NC}: Configuration file does not exist at $CONFIG_FILE"
    exit 1
fi

# Check for font-family setting
EXPECTED_FONT="Monaspice Nerd Font Mono"
if grep -q "font-family.*=.*$EXPECTED_FONT" "$CONFIG_FILE"; then
    echo -e "${GREEN}PASS${NC}: Font configuration found: $EXPECTED_FONT"
else
    echo -e "${RED}FAIL${NC}: Font configuration not found or incorrect"
    echo "Expected: font-family = $EXPECTED_FONT"
    echo "Current font settings in config:"
    grep -n "font" "$CONFIG_FILE" || echo "No font settings found"
    exit 1
fi

# Verify font-family line is not commented out
if grep -q "^[[:space:]]*#.*font-family.*$EXPECTED_FONT" "$CONFIG_FILE"; then
    echo -e "${RED}FAIL${NC}: Font configuration is commented out"
    exit 1
fi

# Check if font is available on system (optional check)
if command -v fc-list &> /dev/null; then
    if fc-list | grep -qi "monaspice.*nerd.*font.*mono"; then
        echo -e "${GREEN}INFO${NC}: Monaspice Nerd Font Mono appears to be installed on system"
    else
        echo -e "${YELLOW}WARN${NC}: Monaspice Nerd Font Mono may not be installed on system"
        echo "         Install with: brew install font-monaspace-nerd-font"
    fi
fi

echo -e "${GREEN}PASS${NC}: Font configuration validation successful"
exit 0