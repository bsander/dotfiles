# Claude Code Configuration

This directory contains configuration files for [Claude Code](https://claude.com/claude-code), the AI coding assistant CLI tool.

## Structure

```
claude/
├── CLAUDE.md                     # Global instructions for Claude (read in all projects)
├── settings.json                 # Core settings (telemetry, permissions, status line, plugins)
├── agents/                       # Custom agent definitions
│   ├── commit-architect.md       # Agent for creating semantic commits
│   └── main-developer.md         # Primary development agent
├── commands/                     # Custom slash commands
│   ├── commit.md                 # /commit command
│   ├── jira.md                   # /jira command
│   └── spar.md                   # /spar command
└── plugins/                      # Plugin configuration (snapshot)
    ├── config.json               # Plugin repository config
    ├── installed_plugins.json    # Currently installed plugins with versions
    └── known_marketplaces.json   # Configured plugin marketplaces
```

## Installation

After running `make link`, the files in this directory will be symlinked to `~/.claude/`.

The Makefile handles symlinking, but plugin installation must be done manually.

## Plugin Installation

The plugin JSON files are a **dynamic snapshot** of currently installed plugins. They change over time as you add/remove plugins.

### Current Setup (from JSON files)

**Marketplaces:**
- `superpowers-marketplace` (obra/superpowers-marketplace)

**Installed Plugins:**
- superpowers
- superpowers-chrome
- elements-of-style
- episodic-memory

### To Reinstall Plugins on a New Machine

1. **Add marketplaces** (from `known_marketplaces.json`):
   ```bash
   claude plugin marketplace add obra/superpowers-marketplace
   ```

2. **Install plugins** (from `installed_plugins.json`):
   ```bash
   claude plugin install superpowers@superpowers-marketplace
   claude plugin install superpowers-chrome@superpowers-marketplace
   claude plugin install elements-of-style@superpowers-marketplace
   claude plugin install episodic-memory@superpowers-marketplace
   ```

3. **Or browse and install interactively:**
   ```bash
   claude plugin marketplace list    # See available marketplaces
   /plugin                            # Browse and install from within Claude
   ```

### Plugin Configuration Notes

- **Tracked files**: These JSON files show what's installed but don't contain the actual plugin code
- **Not tracked**: Plugin cache (~7MB), downloaded marketplace repos, and other ephemeral data
- **Enabled/Disabled**: Plugin enable/disable state is stored in `settings.json` under `enabledPlugins`
- **Update plugins**: Run `claude plugin marketplace update` to update all marketplaces

## Files Not Tracked

These directories/files are **not** part of this repo (excluded via `.gitignore`):

- `settings.local.json` - Machine-specific settings (permissions, etc.)
- `plugins/cache/` - Downloaded plugin code
- `plugins/marketplaces/` - Downloaded marketplace repositories
- `projects/` - Per-project conversation history and state
- `history.jsonl` - Global conversation history
- `file-history/` - File edit history
- `todos/` - Todo state
- `debug/` - Debug logs
- `shell-snapshots/` - Shell session snapshots
- `config/` - UI state (notifications, etc.)
- And other ephemeral data

## Customization

### Adding Custom Agents

Create a new `.md` file in `agents/` describing the agent's behavior. See existing agents for examples.

### Adding Custom Commands

Create a new `.md` file in `commands/` with the slash command logic. The file name becomes the command name (e.g., `foo.md` → `/foo`).

### Updating Global Instructions

Edit `CLAUDE.md` to add project-agnostic instructions that apply to all Claude conversations.

## References

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [Claude Code Plugins](https://docs.claude.com/en/docs/claude-code/plugins)
- [Superpowers Marketplace](https://github.com/obra/superpowers-marketplace)
