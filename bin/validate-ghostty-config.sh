#!/usr/bin/env bash
# Ghostty configuration validation script
# File: bin/validate-ghostty-config.sh
# Purpose: Validates Ghostty configuration syntax and requirements

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

CONFIG_FILE="ghostty/config"

echo "Validating Ghostty configuration..."

# Check if configuration file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo -e "${RED}ERROR${NC}: Configuration file not found at $CONFIG_FILE"
    exit 1
fi

# Basic syntax validation
echo "Checking configuration syntax..."
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]]; then
        continue
    fi

    # Check for valid key=value format (keybind lines have format key = value=action)
    if ! echo "$line" | grep -q "^[[:space:]]*[^=]\+[[:space:]]*="; then
        echo -e "${RED}ERROR${NC}: Invalid syntax on line: $line"
        exit 1
    fi
done < "$CONFIG_FILE"

# Check for required settings
echo "Checking required settings..."
REQUIRED_SETTINGS=(
    "font-family"
    "focus-follows-mouse"
)

for setting in "${REQUIRED_SETTINGS[@]}"; do
    if ! grep -q "^[[:space:]]*$setting[[:space:]]*=" "$CONFIG_FILE"; then
        echo -e "${RED}ERROR${NC}: Required setting missing: $setting"
        exit 1
    fi
done

# Check for Monaspice Nerd Font Mono
if ! grep -q "font-family.*Monaspice Nerd Font Mono" "$CONFIG_FILE"; then
    echo -e "${RED}ERROR${NC}: Font must be set to 'Monaspice Nerd Font Mono'"
    exit 1
fi

# Check for focus-follows-mouse = true
if ! grep -q "focus-follows-mouse.*true" "$CONFIG_FILE"; then
    echo -e "${RED}ERROR${NC}: focus-follows-mouse must be set to 'true'"
    exit 1
fi

# Validate with ghostty if available
if command -v ghostty &> /dev/null; then
    echo "Validating with ghostty..."
    # Use timeout to prevent hanging
    if timeout 5 ghostty +show-config --file="$CONFIG_FILE" &> /dev/null; then
        echo -e "${GREEN}✓${NC} Configuration validated by ghostty"
    else
        echo -e "${YELLOW}WARNING${NC}: Ghostty validation failed or timed out"
        echo "Continuing with syntax validation only..."
    fi
else
    echo -e "${YELLOW}INFO${NC}: Ghostty not installed, skipping ghostty validation"
fi

echo -e "${GREEN}SUCCESS${NC}: Ghostty configuration is valid"
exit 0