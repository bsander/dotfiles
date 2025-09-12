# Zellij Configuration

A terminal multiplexer configuration optimized for development workflows with Neovim and Claude.

## Overview

This configuration provides:
- **Vim-like keybindings** for intuitive navigation
- **Predefined layouts** for common development scenarios
- **Helper scripts** for quick session management
- **Optimized settings** for Fish shell and macOS

## Quick Start

```bash
# Install configuration (from dotfiles root)
make link

# Start a development session
zdev

# Start with specific layout
zdev -l dev-full

# Add Claude to existing session
zclaude
```

## Layouts

### `default.kdl`
Simple single terminal pane for general use.

### `dev.kdl` 
**Editor + Claude (Vertical Split)**
```
┌─────────────────────┬──────────────┐
│                     │              │
│      Editor         │    Claude    │
│      (67%)          │    (33%)     │
│                     │              │
└─────────────────────┴──────────────┘
```

### `dev-full.kdl`
**Editor + Logs + Claude**
```
┌─────────────────────┬──────────────┐
│      Editor         │              │
│      (Top)          │    Claude    │
├─────────────────────┤    (33%)     │
│      Logs/Watch     │              │
│      (Bottom 25%)   │              │
└─────────────────────┴──────────────┘
```

### `dev-horizontal.kdl`
**Horizontal Split Layout**
```
┌─────────────────────────────────────┐
│              Editor                 │
│              (60%)                  │
├──────────────────┬──────────────────┤
│     Claude       │    Terminal      │
│     (50%)        │    (50%)         │
└──────────────────┴──────────────────┘
```

## Key Bindings

### Mode Switching
- `Ctrl+p` → **Pane mode** (manage panes)
- `Ctrl+t` → **Tab mode** (manage tabs)
- `Ctrl+n` → **Resize mode** (resize panes)
- `Ctrl+s` → **Scroll mode** (scroll through history)
- `Ctrl+o` → **Session mode** (session management)
- `Ctrl+g` → **Lock mode** (disable all keys)

### Pane Management (Ctrl+p)
- `h/j/k/l` → Navigate between panes
- `n` → New pane
- `d` → New pane below
- `r` → New pane to the right
- `x` → Close current pane
- `f` → Toggle fullscreen
- `z` → Toggle pane frames

### Tab Management (Ctrl+t)
- `n` → New tab
- `x` → Close tab
- `h/l` → Previous/next tab
- `r` → Rename tab
- `1-9` → Go to tab number

### Resize Mode (Ctrl+n)
- `h/j/k/l` → Increase size in direction
- `H/J/K/L` → Decrease size in direction
- `+/=` → Increase size
- `-` → Decrease size

### Global Shortcuts (Always Available)
- `Alt+n` → New pane
- `Alt+h/j/k/l` → Navigate panes
- `Alt+=/-` → Resize current pane
- `Ctrl+q` → Quit Zellij

## Helper Scripts

All scripts are in `bin/` and should be in your PATH after linking.

### `zdev` - Development Sessions

Start Zellij sessions with predefined layouts:

```bash
# Start default dev session (nvim + claude)
zdev

# Start with specific layout
zdev -l dev-full

# Start with custom session name
zdev myproject

# Attach to existing session or create new
zdev -a myproject

# List available layouts
zdev --list-layouts
```

**Options:**
- `-l, --layout LAYOUT` - Use specific layout
- `-a, --attach` - Attach to existing session if exists
- `-d, --detach` - Start detached
- `--list-layouts` - Show available layouts

### `zlayout` - Layout Switching

Switch layouts in current session or start new one:

```bash
# Interactive layout selection
zlayout

# Switch to specific layout
zlayout dev-horizontal
```

### `zclaude` - Claude Integration

Add Claude pane to existing session:

```bash
# Add Claude to the right (33% width)
zclaude

# Add Claude to bottom (33% height)
zclaude --bottom

# Custom width/height
zclaude --right --width 40
zclaude --bottom --height 25
```

## Configuration Highlights

### Settings
- **Shell**: Fish (configurable in `config.kdl`)
- **Mouse**: Disabled (keyboard-driven workflow)
- **Clipboard**: pbcopy integration for macOS
- **Scrollback**: 10,000 lines
- **Theme**: Dracula
- **Pane frames**: Enabled for visual clarity

### Layout Directory
Custom layouts are stored in `layouts/` and automatically detected by helper scripts.

### Plugin Configuration
- Compact bar for minimal UI
- Session manager for easy session switching
- File browser (Strider) available

## Customization

### Adding New Layouts
Create `.kdl` files in `layouts/` directory:

```kdl
layout {
    default_tab_template {
        children
        pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
        }
    }

    tab name="my-layout" {
        pane split_direction="vertical" {
            pane name="main" focus=true
            pane size="30%" name="side"
        }
    }
}
```

### Modifying Keybindings
Edit `config.kdl` in the `keybinds` section. Each mode can have different bindings.

### Changing Theme
Modify the `theme` setting in `config.kdl` or add custom themes in the `themes` section.

## Tips

1. **Start with `zdev`** - It's the most common layout you'll use
2. **Learn the modes** - `Ctrl+p` for panes, `Ctrl+t` for tabs
3. **Use `Alt+hjkl`** - Quick pane navigation without entering pane mode
4. **Try `zclaude`** - Easy way to add Claude to any existing session
5. **Session persistence** - Zellij sessions survive terminal closure

## Troubleshooting

### Scripts not found
Ensure `bin/` directory is linked and in your PATH:
```bash
# From dotfiles root
make link
# Restart shell or source your shell config
```

### Layout not found
Check that layout files exist and are named correctly:
```bash
ls ~/.config/zellij/layouts/
```

### Claude command not available
Install Claude CLI or modify layouts to use different commands.

### Permission denied
Ensure scripts are executable:
```bash
chmod +x bin/z*
```