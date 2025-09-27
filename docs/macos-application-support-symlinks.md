# macOS Application Support Symlink Automation

## Overview

This document describes the automated system for creating and managing symlinks between `~/.config` directories and `~/Library/Application Support` directories on macOS. This is necessary because some macOS applications look for configuration files in their Application Support directory rather than following XDG conventions.

## The Problem

Many CLI tools and applications follow XDG Base Directory conventions and expect configuration files in `~/.config/<app>/`. However, some macOS applications (especially GUI applications) expect configuration files in `~/Library/Application Support/<app>/`.

When managing dotfiles, we want to:
1. Keep configuration files in version control under the dotfiles directory
2. Symlink them to `~/.config/<app>/` for XDG compliance
3. **Also** symlink them to `~/Library/Application Support/<app>/` for macOS compatibility
4. Automatically recreate all symlinks when setting up dotfiles from scratch

## The Solution

### Symlink Chain Structure

The solution creates a symlink chain:

```
dotfiles/<app>/config.yml
    ↓ (symlinked by link-to-config)
~/.config/<app>/config.yml
    ↓ (symlinked by link-macos-app-support)
~/Library/Application Support/<app>/config.yml
```

### Implementation Components

#### 1. Variable Declaration

In the Makefile, applications requiring Application Support symlinks are declared:

```makefile
DFS_MACOS_APP_SUPPORT = lazygit
```

To add more applications, simply extend this variable:

```makefile
DFS_MACOS_APP_SUPPORT = lazygit anotherapp thirdapp
```

#### 2. macOS Detection

The system only creates Application Support symlinks on macOS:

```makefile
ifeq ($(shell uname -s),Darwin)
    # macOS-specific commands here
endif
```

#### 3. Symlink Creation Target

The `link-macos-app-support` target handles the symlink creation:

```makefile
link-macos-app-support:
ifeq ($(shell uname -s),Darwin)
	$(foreach f, $(DFS_MACOS_APP_SUPPORT), $(call link-macos-app-support-func,$(f)))
endif

define link-macos-app-support-func
	mkdir -p "$(HOME)/Library/Application Support/$(1)"
	ln -snf "$(HOME)/.config/$(1)/config.yml" "$(HOME)/Library/Application Support/$(1)/config.yml"
endef
```

#### 4. Integration with Main Link Target

The Application Support linking is integrated into the main `link` target:

```makefile
link: $(HOME)/.zshlocal link-to-home link-to-config link-nvim link-macos-app-support
```

## Usage

### Fresh Setup

When setting up dotfiles from scratch:

```bash
make link
```

This will create all symlinks, including the Application Support ones on macOS.

### Adding New Applications

1. Add the application directory to your dotfiles (e.g., `newapp/`)
2. Add it to `DFS_CONFIG` for ~/.config symlinks:
   ```makefile
   DFS_CONFIG = fish kitty zellij ghostty lazygit newapp
   ```
3. If it needs Application Support symlinks, add it to `DFS_MACOS_APP_SUPPORT`:
   ```makefile
   DFS_MACOS_APP_SUPPORT = lazygit newapp
   ```
4. Run `make link` to create all symlinks

### Manual Testing

To test just the Application Support symlinks:

```bash
make link-macos-app-support
```

## Example: lazygit Integration

### Before Integration
- Config file: `~/.config/lazygit/config.yml` (manual)
- Application Support: `~/Library/Application Support/lazygit/config.yml` -> `~/.config/lazygit/config.yml` (manual symlink)
- State file: `~/Library/Application Support/lazygit/state.yml` (preserved, not symlinked)

### After Integration
- Dotfiles: `dotfiles/lazygit/config.yml` (version controlled)
- Config symlink: `~/.config/lazygit/config.yml` -> `dotfiles/lazygit/config.yml` (automatic)
- App Support symlink: `~/Library/Application Support/lazygit/config.yml` -> `~/.config/lazygit/config.yml` (automatic)
- State file: `~/Library/Application Support/lazygit/state.yml` (preserved, untouched)

## File Structure

```
dotfiles/
├── Makefile                     # Contains symlink automation
├── lazygit/
│   └── config.yml              # Version controlled config
└── docs/
    └── macos-application-support-symlinks.md  # This file

~/.config/
└── lazygit/
    └── config.yml -> /path/to/dotfiles/lazygit/config.yml

~/Library/Application Support/
└── lazygit/
    ├── config.yml -> /Users/username/.config/lazygit/config.yml
    └── state.yml               # Preserved, not symlinked
```

## Troubleshooting

### Symlink Not Created
- Verify you're on macOS: `uname -s` should return "Darwin"
- Check the application is in `DFS_MACOS_APP_SUPPORT`
- Ensure the `~/.config/<app>/config.yml` exists first

### Wrong Symlink Target
- The Application Support symlink should point to `~/.config/<app>/config.yml`
- The `~/.config/<app>/config.yml` should point to the dotfiles version

### Application Still Can't Find Config
- Some applications may look for different filenames
- Check the application's documentation for expected config file names
- Adjust the symlink creation function if needed

### State Files
- Don't symlink state files (they contain runtime/user-specific data)
- Only symlink configuration files that should be version controlled
- State files typically include: `state.yml`, `cache/`, `logs/`, etc.

## Design Principles

1. **Preserve State**: Never symlink or version control application state files
2. **macOS Only**: Application Support symlinks only created on Darwin
3. **Extensible**: Easy to add new applications by updating variables
4. **Automatic**: No manual intervention required after initial setup
5. **Safe**: Uses `ln -snf` to safely overwrite existing symlinks

## Future Considerations

- Applications may use different config file names (not always `config.yml`)
- Some apps may need multiple config files symlinked
- The system could be extended to handle different config file structures per application