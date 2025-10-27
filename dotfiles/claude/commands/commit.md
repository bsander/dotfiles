# Commit Current Changes

Intelligently analyze and commit all changes with proper message formatting and logical grouping.

## Workflow Process

1. **Analyze repository state**: Check `git status` and `git diff` to understand all modifications
2. **Review change quality**: Ensure no secrets, debugging code, or temporary fixes remain
3. **Group logically**: Separate unrelated changes into multiple commits when beneficial
4. **Craft clear messages**: Write descriptive commit messages following established conventions
5. **Execute commits**: Stage and commit changes with verification

## Requirements

- **Commit messages**: Use short, concise messages in imperative mood (under 72 characters)
- **⚠️ ABSOLUTELY NO SIGNING**: Never sign commits or add any signature lines whatsoever
- **Logical separation**: Group related changes into separate commits when appropriate
- **Security check**: Verify no sensitive data is being committed

## ⚠️ CRITICAL: NO SIGNATURES ALLOWED

**NEVER** include any of the following in commit messages:
- `Co-Authored-By:` lines
- `Signed-off-by:` lines  
- Any reference to Claude, Anthropic, or Claude Code
- Any signature or attribution text
- Any generated metadata or tool references

## Commit Message Guidelines

### Format Standards
- **Imperative mood**: "Add feature" not "Added feature" or "Adding feature"
- **Present tense**: Describe what the commit does, not what was done
- **Capitalize first word**: "Fix bug" not "fix bug"
- **No period**: End without punctuation
- **Be specific**: Avoid vague terms like "fix stuff" or "update things"

### Good Examples
- `Add user authentication system`
- `Fix memory leak in data processor`
- `Update API documentation for v2.0`
- `Refactor database connection logic`
- `Remove deprecated helper functions`
- `Configure nginx SSL certificates`
- `Implement dark mode toggle`

### Bad Examples
- `🤖 Generated with [Claude Code](https://claude.ai/code)` (tool attribution)
- `Co-Authored-By: Claude <noreply@anthropic.com>` (signature)
- `Signed-off-by: Claude Code Assistant` (signature)
- `Fixed some bugs` (vague)
- `WIP: still working on this` (not final)
- `Updated stuff.` (vague + period)

## Logical Grouping Strategy

### Separate commits for:
- **Different functional areas**: Frontend vs backend changes
- **Different change types**: Features vs bug fixes vs refactoring vs documentation
- **Independent modifications**: Changes that could be reviewed/reverted separately
- **Configuration vs code**: Settings changes vs implementation changes

### Single commit for:
- **Related feature work**: Multiple files implementing the same feature
- **Interdependent changes**: Modifications that depend on each other
- **Small related fixes**: Minor improvements to the same component

## Command Arguments (optional)

#$ARGUMENTS


## Security Checklist

Before committing, verify:
- ❌ No API keys, passwords, or tokens
- ❌ No debugging console.log or print statements
- ❌ No TODO/FIXME comments for production code
- ❌ No temporary test files or mock data
- ❌ No sensitive configuration or credentials
- ✅ All changes are intentional and complete

## Execution Process

The assistant will:
1. Run `git status` and `git diff` to analyze current state
2. Review all changes for quality and security
3. Determine optimal commit grouping strategy
4. Stage files and create commits with descriptive messages
5. Verify successful completion and show final status

## Directive

Analyze the current repository state and commit all changes following the guidelines above.

**Required codeword**: "banana" (must be present in the directive to proceed with actual commits)
