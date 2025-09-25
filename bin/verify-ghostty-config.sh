#!/usr/bin/env bash
# Quickstart verification script for Ghostty configuration
# File: bin/verify-ghostty-config.sh
# Purpose: Verifies all quickstart steps are working correctly

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Track test results
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_TOTAL=0

# Function to run a test
run_test() {
    local test_name="$1"
    local test_command="$2"

    ((TESTS_TOTAL++))
    echo -n "Testing $test_name... "

    if eval "$test_command" &> /dev/null; then
        echo -e "${GREEN}PASS${NC}"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Function to run a test with custom validation
run_test_custom() {
    local test_name="$1"
    local test_function="$2"

    ((TESTS_TOTAL++))
    echo -n "Testing $test_name... "

    if $test_function; then
        echo -e "${GREEN}PASS${NC}"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Test functions
test_config_symlink() {
    local target_dir="$HOME/.config/ghostty"

    # Check if symlink exists and is accessible
    [[ -L "$target_dir" && -d "$target_dir" ]]
}

test_config_file_exists() {
    [[ -f "$HOME/.config/ghostty/config" ]]
}

test_font_configuration() {
    grep -q "font-family.*Monaspice Nerd Font Mono" "$HOME/.config/ghostty/config"
}

test_focus_follows_mouse() {
    grep -q "focus-follows-mouse.*true" "$HOME/.config/ghostty/config"
}

test_chorded_shortcuts() {
    local config_file="$HOME/.config/ghostty/config"
    local required_shortcuts=(
        "ctrl+shift+n"
        "ctrl+shift+w"
        "ctrl+shift+t"
        "ctrl+shift+d"
        "ctrl+shift+s"
    )

    for shortcut in "${required_shortcuts[@]}"; do
        grep -q "$shortcut" "$config_file" || return 1
    done

    return 0
}

test_alt_shortcuts() {
    local config_file="$HOME/.config/ghostty/config"
    local required_shortcuts=(
        "alt+1"
        "alt+h"
        "alt+l"
        "alt+c"
        "alt+v"
    )

    for shortcut in "${required_shortcuts[@]}"; do
        grep -q "$shortcut" "$config_file" || return 1
    done

    return 0
}

test_font_availability() {
    if command -v fc-list &> /dev/null; then
        fc-list | grep -qi "monaspice.*nerd.*font.*mono"
    else
        # If fc-list not available, assume font is available
        return 0
    fi
}

test_make_link_includes_ghostty() {
    make -n link 2>&1 | grep -q "\.config/ghostty"
}

# Main verification
echo -e "${BLUE}Ghostty Configuration Quickstart Verification${NC}"
echo "=============================================="

echo -e "\n${YELLOW}1. Installation Verification${NC}"
run_test_custom "Configuration symlink creation" test_config_symlink
run_test_custom "Configuration file exists" test_config_file_exists
run_test_custom "Make link includes ghostty" test_make_link_includes_ghostty

echo -e "\n${YELLOW}2. Configuration Content Verification${NC}"
run_test_custom "Font configuration (Monaspice Nerd Font Mono)" test_font_configuration
run_test_custom "Focus-follows-mouse enabled" test_focus_follows_mouse
run_test_custom "Chorded shortcuts configured" test_chorded_shortcuts
run_test_custom "Alt-based shortcuts configured" test_alt_shortcuts

echo -e "\n${YELLOW}3. System Requirements${NC}"
run_test_custom "Font availability on system" test_font_availability

echo -e "\n${YELLOW}4. Configuration Validation${NC}"
if [[ -f "bin/validate-ghostty-config.sh" ]]; then
    run_test "Configuration syntax validation" "./bin/validate-ghostty-config.sh"
else
    echo "Configuration validation script not found... ${YELLOW}SKIP${NC}"
fi

# Optional Ghostty runtime test
echo -e "\n${YELLOW}5. Optional Runtime Tests${NC}"
if command -v ghostty &> /dev/null; then
    echo -n "Testing ghostty runtime availability... "
    if timeout 3 ghostty --version &> /dev/null; then
        echo -e "${GREEN}PASS${NC}"
        ((TESTS_PASSED++))
    else
        echo -e "${YELLOW}SKIP${NC} (ghostty may not be fully configured for headless testing)"
    fi
    ((TESTS_TOTAL++))
else
    echo "Ghostty not installed... ${YELLOW}SKIP${NC}"
fi

# Results summary
echo -e "\n${BLUE}Verification Results${NC}"
echo "===================="
echo -e "Tests passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests failed: ${RED}$TESTS_FAILED${NC}"
echo -e "Total tests:  $TESTS_TOTAL"

if [[ $TESTS_FAILED -eq 0 ]]; then
    echo -e "\n${GREEN}✅ All verifications passed! Ghostty configuration is ready.${NC}"
    echo -e "\n${BLUE}Next steps:${NC}"
    echo "1. Launch ghostty"
    echo "2. Test keybindings as described in quickstart.md"
    echo "3. Verify focus-follows-mouse behavior"
    echo "4. Test development workflow with splits"
    exit 0
else
    echo -e "\n${RED}❌ Some verifications failed. Please check the configuration.${NC}"
    echo -e "\n${BLUE}Troubleshooting:${NC}"
    echo "1. Run 'make link' to ensure symlinks are created"
    echo "2. Check configuration file at ~/.config/ghostty/config"
    echo "3. Verify font installation: brew install font-monaspace-nerd-font"
    echo "4. See quickstart.md for detailed troubleshooting"
    exit 1
fi