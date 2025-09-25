#!/usr/bin/env bash
# Test: Configuration syntax validation test
# File: tests/ghostty/test_config_syntax.sh
# Purpose: Validates Ghostty configuration syntax using ghostty +show-config

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Testing Ghostty configuration syntax validation..."

# Test configuration file path
CONFIG_FILE="$(pwd)/ghostty/config"

# Check if configuration file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo -e "${RED}FAIL${NC}: Configuration file does not exist at $CONFIG_FILE"
    exit 1
fi

# Check if ghostty command is available
if ! command -v ghostty &> /dev/null; then
    echo -e "${YELLOW}SKIP${NC}: Ghostty not installed, cannot validate syntax"
    exit 0
fi

# Validate configuration syntax using ghostty
if ghostty +show-config --file="$CONFIG_FILE" &> /dev/null; then
    echo -e "${GREEN}PASS${NC}: Configuration syntax is valid"
    exit 0
else
    echo -e "${RED}FAIL${NC}: Configuration syntax validation failed"
    echo "Error details:"
    ghostty +show-config --file="$CONFIG_FILE" 2>&1 || true
    exit 1
fi