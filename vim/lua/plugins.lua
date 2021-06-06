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

      -- use lua keymaps: https://github.com/svermeulen/vimpeccable
      -- use 'svermeulen/vimpeccable'

      -- useful lua functions https://github.com/nvim-lua/plenary.nvim
      use "nvim-lua/plenary.nvim"

      -- Telescope: Find, Filter, Preview, Pick: https://github.com/nvim-telescope/telescope.nvim
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-lua/popup.nvim"},
          {"nvim-lua/plenary.nvim"}
        }
      }

      -- Z for Telescope: https://github.com/nvim-telescope/telescope-z.nvim
      use {
        "nvim-telescope/telescope-z.nvim",
        requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-lua/popup.nvim"},
          {"nvim-telescope/telescope.nvim"}
        },
        config = function()
          require "telescope".load_extension "z"
        end
      }

      -- Flash line when navigating search results
      use "inside/vim-search-pulse"

      -- Tabline plugin: https://github.com/romgrk/barbar.nvim
      use {
        "romgrk/barbar.nvim",
        requires = {"kyazdani42/nvim-web-devicons"} -- Only load icons when using nerd fonts
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

      -- Git signs in gutter: https://github.com/lewis6991/gitsigns.nvim/
      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
          require("gitsigns").setup()
        end
      }

      --- Auto-cwd to project root directory:
      -- https://github.com/ygm2/rooter.nvim
      -- g.rooter_pattern = {'.git'}
      -- use { 'ygm2/rooter.nvim' }
      -- https://github.com/dbakker/vim-projectroot
      use "dbakker/vim-projectroot"

      -- Building block for syntax highlighting and more: https://github.com/nvim-treesitter/nvim-treesitter
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }
      use {
        "nvim-treesitter/playground",
        requires = {"nvim-treesitter/nvim-treesitter"}
      }
      use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = {"nvim-treesitter/nvim-treesitter"}
      }

      -- LSP: https://github.com/neovim/nvim-lspconfig
      use {
        "neovim/nvim-lspconfig"
      }
      use {
        "kabouzeid/nvim-lspinstall",
        requires = {"neovim/nvim-lspconfig"}
      }
      use {
        "glepnir/lspsaga.nvim",
        requires = {"neovim/nvim-lspconfig"},
        config = function()
          require "lspsaga".init_lsp_saga()
        end
      }

      -- https://www.reddit.com/r/neovim/comments/nq70dt/signature_help_using_new_open_floating_preview_api/
      use {
        "ray-x/lsp_signature.nvim",
        config = function()
          require "lsp_signature".on_attach()
        end
      }

      -- Git repository management:
      use {
        "TimUntersberger/neogit",
        requires = {
          "nvim-lua/plenary.nvim",
          "sindrets/diffview.nvim"
        }
      }

      -- Bufferize command output (like :messages): https://github.com/AndrewRadev/bufferize.vim
      use "AndrewRadev/bufferize.vim"

      -- Black and White color scheme: https://github.com/pgdouyon/vim-yin-yang
      use "pgdouyon/vim-yin-yang"

      -- Autocompletion: https://github.com/hrsh7th/nvim-compe
      use "hrsh7th/nvim-compe"

      -- Autopairing: https://github.com/windwp/nvim-autopairs
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()
        end
      }

      -- Surround stuff: https://github.com/blackCauldron7/surround.nvim
      use {
        "blackCauldron7/surround.nvim",
        config = function()
          require "surround".setup {
            mappings_style = "surround"
          }
        end
      }

      -- File formatter: https://github.com/mhartington/formatter.nvim
      use "mhartington/formatter.nvim"

      -- Smooth scrolling: https://github.com/karb94/neoscroll.nvim
      use {
        "karb94/neoscroll.nvim",
        config = function()
          require("neoscroll").setup()
        end
      }

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
