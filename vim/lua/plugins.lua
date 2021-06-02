local execute = vim.api.nvim_command
local fn = vim.fn
local g = vim.g

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

require('packer').startup({ function()
  -- Packer can manage itself: https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- use lua keymaps and autoload lua plugins: https://github.com/tjdevries/astronauta.nvim
  use 'tjdevries/astronauta.nvim'

  -- use lua keymaps: https://github.com/svermeulen/vimpeccable
  -- use 'svermeulen/vimpeccable'

  -- useful lua functions https://github.com/nvim-lua/plenary.nvim
  use 'nvim-lua/plenary.nvim'

  -- Telescope: Find, Filter, Preview, Pick: https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- Z for Telescope: https://github.com/nvim-telescope/telescope-z.nvim
  use {
    'nvim-telescope/telescope-z.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require'telescope'.load_extension'z'
    end,
  }
  -- Tabline plugin: https://github.com/romgrk/barbar.nvim
  use {
    'romgrk/barbar.nvim',
    -- requires = {'kyazdani42/nvim-web-devicons'} -- Only load icons when using nerd fonts
  }

  -- One colorscheme: https://github.com/Th3Whit3Wolf/one-nvim
  use 'Th3Whit3Wolf/one-nvim'

  -- Git signs in gutter: https://github.com/lewis6991/gitsigns.nvim/
  use {
  'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  --- Auto-cwd to project root directory:
  -- https://github.com/ygm2/rooter.nvim
  -- g.rooter_pattern = {'.git'}
  -- use { 'ygm2/rooter.nvim' }
  -- https://github.com/dbakker/vim-projectroot
  use 'dbakker/vim-projectroot'

  -- Building block for syntax highlighting and more: https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-treesitter/playground',
    requires = {'nvim-treesitter/nvim-treesitter'}
  }

  -- LSP: https://github.com/neovim/nvim-lspconfig
  use {
    'neovim/nvim-lspconfig'
  }
  use {
    'kabouzeid/nvim-lspinstall',
    requires = {'neovim/nvim-lspconfig'},
    config = function()
      require'lspinstall'.setup()
      local servers = require'lspinstall'.installed_servers()
      for _, server in pairs(servers) do
        require'lspconfig'[server].setup{}
      end
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    requires = {'neovim/nvim-lspconfig'},
    config = function()
      require 'lspsaga'.init_lsp_saga()
    end
  }

  -- https://www.reddit.com/r/neovim/comments/nq70dt/signature_help_using_new_open_floating_preview_api/
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require'lsp_signature'.on_attach()
    end
  }

  -- Git repository management: 
  use { 
    'TimUntersberger/neogit', 
    requires = { 
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim' 
    }
  }

  -- Bufferize command output (like :messages): https://github.com/AndrewRadev/bufferize.vim
  use 'AndrewRadev/bufferize.vim'

  -- Black and White color scheme: https://github.com/pgdouyon/vim-yin-yang
  use 'pgdouyon/vim-yin-yang'

  end, -- End of plugin definitions
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }}
)

