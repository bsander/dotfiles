local execute = vim.api.nvim_command
local fn = vim.fn
local g = vim.g

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

require("packer").startup(
  {
    function()
      local use = use
      -- Packer can manage itself: https://github.com/wbthomason/packer.nvim
      use "wbthomason/packer.nvim"

      -- use lua keymaps and autoload lua plugins: https://github.com/tjdevries/astronauta.nvim
      use "tjdevries/astronauta.nvim"

      -- Unix helpers: https://github.com/tpope/vim-eunuch
      use "tpope/vim-eunuch"

      -- use lua keymaps: https://github.com/svermeulen/vimpeccable
      -- use 'svermeulen/vimpeccable'

      -- useful lua functions https://github.com/nvim-lua/plenary.nvim
      use "nvim-lua/plenary.nvim"

      -- Telescope: Find, Filter, Preview, Pick: https://github.com/nvim-telescope/telescope.nvim
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim"
        }
      }

      -- Z for Telescope: https://github.com/nvim-telescope/telescope-z.nvim
      use {
        "nvim-telescope/telescope-z.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-lua/popup.nvim",
          "nvim-telescope/telescope.nvim"
        },
        config = function()
          require "telescope".load_extension "z"
        end
      }

      -- Wildmenu upgrade
      use "gelguy/wilder.nvim"

      -- Flash line when navigating search results
      use "inside/vim-search-pulse"

      -- -- Tabline plugin: https://github.com/romgrk/barbar.nvim
      -- use {
      --   "romgrk/barbar.nvim",
      --   requires = "kyazdani42/nvim-web-devicons" -- Only load icons when using nerd fonts
      -- }

      -- Delete buffers without messing up layout
      use "famiu/bufdelete.nvim"

      -- Bufferline
      use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("bufferline").setup(
            {
              diagnostics = "nvim_lsp",
              sort_by = "directory",
              custom_filter = function(buf_number)
                if vim.bo[buf_number].filetype == "qf" then
                  return true
                end
              end
            }
          )
        end
      }

      -- Statusline plugin: https://github.com/Famiu/feline.nvim
      -- use {"beauwilliams/statusline.lua"} -- Doesn't work so well with barbar
      -- use {
      --   "Famiu/feline.nvim",
      --   config = function()
      --     require("feline").setup()
      --   end
      -- }

      -- One colorscheme: https://github.com/Th3Whit3Wolf/one-nvim
      use "Th3Whit3Wolf/one-nvim"
      -- Minimal color scheme: https://github.com/cideM/yui
      use "cideM/yui"
      -- Monotone color scheme: https://github.com/Lokaltog/vim-monotone
      use "Lokaltog/vim-monotone"
      -- Gruvbox: https://github.com/gruvbox-community/gruvbox
      use "gruvbox-community/gruvbox"
      -- `Community edition, waiting for https://github.com/npxbr/gruvbox.nvim/issues/16`
      -- use {"npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim"}

      -- Git signs in gutter: https://github.com/lewis6991/gitsigns.nvim/
      -- use {
      --   "lewis6991/gitsigns.nvim",
      --   requires = "nvim-lua/plenary.nvim",
      --   config = function()
      --     require("gitsigns").setup()
      --   end
      -- }

      --- Auto-cwd to project root directory:
      -- https://github.com/ygm2/rooter.nvim
      -- g.rooter_pattern = {'.git'}
      -- use { 'ygm2/rooter.nvim' }
      -- https://github.com/dbakker/vim-projectroot
      use "dbakker/vim-projectroot"

      -- Building block for syntax highlighting and more: https://github.com/nvim-treesitter/nvim-treesitter
      use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate"
      }
      use {
        "nvim-treesitter/playground",
        requires = "nvim-treesitter/nvim-treesitter"
      }
      use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = "nvim-treesitter/nvim-treesitter"
      }

      -- Glow for markdown: https://github.com/npxbr/glow.nvim
      -- use {"npxbr/glow.nvim", branch = "main", run = ":GlowInstall"}

      -- LSP: https://github.com/neovim/nvim-lspconfig
      use {
        "neovim/nvim-lspconfig"
      }

      use {
        "kabouzeid/nvim-lspinstall",
        requires = "neovim/nvim-lspconfig"
      }

      use {
        "glepnir/lspsaga.nvim",
        requires = "neovim/nvim-lspconfig",
        config = function()
          require "lspsaga".init_lsp_saga()
        end
      }

      -- FZF for LSP
      use {
        "ojroques/nvim-lspfuzzy",
        requires = {
          "junegunn/fzf",
          "junegunn/fzf.vim" -- to enable preview (optional)
        }
        -- config = function()
        --   require("lspfuzzy").setup {}
        -- end
      }
      use {
        "chengzeyi/fzf-preview.vim",
        requires = {
          "junegunn/fzf",
          "junegunn/fzf.vim"
        }
      }

      -- Improved fzf.vim written in lua https://github.com/ibhagwan/fzf-lua
      use {
        "ibhagwan/fzf-lua",
        requires = {
          "vijaymarupudi/nvim-fzf",
          "kyazdani42/nvim-web-devicons"
        } -- optional for icons
      }

      -- Better quickfix interaction
      use {"kevinhwang91/nvim-bqf"}

      -- https://www.reddit.com/r/neovim/comments/nq70dt/signature_help_using_new_open_floating_preview_api/
      use {
        "ray-x/lsp_signature.nvim",
        config = function()
          require "lsp_signature".on_attach()
        end
      }

      -- Generate web links to current line in repo
      use {
        "ruifm/gitlinker.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require "gitlinker".setup()
        end
      }

      -- -- Git features
      use "kdheepak/lazygit.nvim"
      use "tpope/vim-fugitive"
      use "rhysd/git-messenger.vim"

      -- Bufferize command output (like :messages): https://github.com/AndrewRadev/bufferize.vim
      use "AndrewRadev/bufferize.vim"

      -- HTTP client
      use {
        "NTBBloodbath/rest.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("rest-nvim").setup()
        end
      }

      -- Black and White color scheme: https://github.com/pgdouyon/vim-yin-yang
      use "pgdouyon/vim-yin-yang"

      -- Autocompletion: https://github.com/hrsh7th/nvim-compe
      use "hrsh7th/nvim-compe"

      -- -- Autopairing: https://github.com/windwp/nvim-autopairs
      -- use {
      --   "windwp/nvim-autopairs",
      --   config = function()
      --     require("nvim-autopairs").setup()
      --   end
      -- }

      -- -- Surround stuff: https://github.com/blackCauldron7/surround.nvim
      -- -- This doesn't really appear to work.
      -- use q{
      --   "blackCauldron7/surround.nvim",
      --   config = function()
      --     require "surround".setup {
      --       mappings_style = "surround"
      --     }
      --   end
      -- }

      -- Vimscript-based surround stuff
      use "tpope/vim-surround"

      -- File formatter: https://github.com/mhartington/formatter.nvim
      use "mhartington/formatter.nvim"

      -- -- Smooth scrolling: https://github.com/karb94/neoscroll.nvim
      -- -- Disabled for slow
      -- use {
      --   "karb94/neoscroll.nvim",
      --   config = function()
      --     require("neoscroll").setup()
      --   end
      -- }

      -- Manage comments: https://github.com/terrortylor/nvim-comment
      use {
        "terrortylor/nvim-comment",
        config = function()
          require("nvim_comment").setup()
        end
      }

      -- Swap textobjects: https://github.com/mizlan/iswap.nvim
      use "mizlan/iswap.nvim"

      -- use "preservim/nerdcommenter"
    end, -- End of plugin definitions
    config = {
      display = {
        open_fn = require("packer.util").float
      }
    }
  }
)
