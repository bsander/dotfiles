.PHONY: install
.ONESHELL:
install: ## Setup these dotfiles on a new Mac
	@echo Installing dotfiles on $$(hostname -s) in $(CURDIR) with PROJECTS=$(PROJECTS)
	# You can still change your mind!
	@read -t 5 -r -s -p $$'Wait 5 seconds or press Enter to continue...\n' || true
	# Let's make sure we have sudo permissions
	@sudo true
	# Installing required software from Apple
	xcode-select -p || xcode-select --install
	# Initializing repo
	git submodule update --init --recursive
# /usr/bin/pgrep oahd >/dev/null 2>&1 || sudo softwareupdate --install-rosetta
	# Installing Homebrew (https://brew.sh/)
	command -v brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$$(/opt/homebrew/bin/brew shellenv)"
# sudo launchctl config user path "/usr/bin:/bin:/usr/sbin:/sbin:$$(brew --prefix)/bin:$$(brew --prefix)/sbin"
## About printing comments: https://stackoverflow.com/a/18363477
# brew --prefix --installed zsh || brew install zsh
# @echo Setting default shell to $$(which zsh)
# grep -qxF $$(which zsh) /etc/shells || echo $$(which zsh) | sudo tee -a /etc/shells
# chsh -s $$(which zsh)
	# Installing homebrew packages from bundle
	brew bundle --file="$(CURDIR)/devices/$$(hostname -s)/Brewfile" install

.PHONY: update
update: ## Update packages from NPM, Homebrew and ZSH
	brew upgrade
	brew bundle --file="$(CURDIR)/devices/$$(hostname -s)/Brewfile" dump --describe --force
	npm upgrade -g
	tldr --update
	@echo Now run: z4h update

link: $(HOME)/.zshlocal link-to-home link-to-config link-nvim ## Setup symlinks in $HOME to dotfiles

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


# ^^^ How the sausage is wrapped
# vvv How the sausage is made


.DEFAULT_GOAL := help

DF_DIR = $(CURDIR)/dotfiles

DFS_HOME = curlrc.ini ripgreprc gitconfig.ini gitignore.txt hushlogin.txt ignore.txt p10k.zsh tigrc.ini zshrc.zsh zshenv.zsh profile.bash
DFS_CONFIG = fish kitty

## Link these dotfiles to $HOME
link-to-home: $(foreach f, $(DFS_HOME), link-to-home-$(f))

link-to-home-%: $(DF_DIR)/%
	ln -snf "$<" $(HOME)/.$(basename $(notdir $*))

## Link these dotfiles to $HOME/.config/
link-to-config: $(foreach f, $(DFS_CONFIG), link-to-config-$(f))

link-to-config-%: $(CURDIR)/%
	ln -snf "$<" $(HOME)/.config/$(basename $(notdir $*))

## Link neovim config to both vim and nvim paths
link-nvim: $(CURDIR)/vim
	ln -snf "$<" $(HOME)/.vim
	ln -snf "$<" $(HOME)/.config/nvim

$(HOME)/.zshlocal:
	cp -n $(CURDIR)/zsh/local.zsh $(HOME)/.zshlocal

# $(HOME)/ssh:
#   mkdir -pv -m 0700 $(HOME)/.ssh
# 	ln -snf
