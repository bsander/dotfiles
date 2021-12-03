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

      -- Repeating plugin actions
      use "tpope/vim-repeat"

      -- use lua keymaps: https://github.com/svermeulen/vimpeccable
      -- use 'svermeulen/vimpeccable'

      -- Open files in the same cursor position as they were closed
      use "farmergreg/vim-lastplace"

      -- Open all kinds of urls
      use "stsewd/gx-extended.vim"

      -- useful lua functions https://github.com/nvim-lua/plenary.nvim
      use "nvim-lua/plenary.nvim"

      -- -- Telescope: Find, Filter, Preview, Pick: https://github.com/nvim-telescope/telescope.nvim
      -- use {
      --   "nvim-telescope/telescope.nvim",
      --   requires = {
      --     "nvim-lua/popup.nvim",
      --     "nvim-lua/plenary.nvim"
      --   }
      -- }

      -- -- Z for Telescope: https://github.com/nvim-telescope/telescope-z.nvim
      -- use {
      --   "nvim-telescope/telescope-z.nvim",
      --   requires = {
      --     "nvim-lua/plenary.nvim",
      --     "nvim-lua/popup.nvim",
      --     "nvim-telescope/telescope.nvim"
      --   },
      --   config = function()
      --     require "telescope".load_extension "z"
      --   end
      -- }

      -- Wildmenu upgrade
      -- use "gelguy/wilder.nvim"

      -- -- Hop - jump to occurrence
      -- use {
      --   "phaazon/hop.nvim",
      --   as = "hop",
      --   config = function()
      --     -- you can configure Hop the way you like here; see :h hop-config
      --     require "hop".setup({})
      --   end
      -- }

      -- Lightspeed - better motion plugin
      use "ggandor/lightspeed.nvim"

      -- Flash line when navigating search results
      -- use "inside/vim-search-pulse"

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

      -- Inline colorizer of color codes
      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require "colorizer".setup({"*"})
        end
      }

      -- Show highlight groups under cursor
      -- use "dylnmc/synstack.vim"
      -- Colorscheme creator
      use "rktjmp/lush.nvim"
      -- Homegrown colorscheme TODO:: fix path
      -- use "/Users/sander/src/playground/tainted-lush-nvim"
      -- collection of contrast-based Vim/Neovim colorschemes
      use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim"
      }
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

      -- -- Rainbow brackets
      -- require("nvim-treesitter.configs").setup {
      --   rainbow = {
      --     enable = true,
      --     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      --     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      --     max_file_lines = nil, -- Do not enable for files with more than n lines, int
      --     -- colors = {}, -- table of hex strings
      --     -- termcolors = {} -- table of colour name strings
      --   }
      -- }

      -- Indentation guides
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("indent_blankline").setup {
            char = "│",
            buftype_exclude = {"terminal"},
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true
          }
        end
      }

      -- Git signs in gutter: https://github.com/lewis6991/gitsigns.nvim/
      use {
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("gitsigns").setup(
            {
              signcolumn = false,
              numhl = true,
              keymaps = {} -- No key mapping by default
            }
          )
        end
      }

      -- Line diffs
      use "AndrewRadev/linediff.vim"

      -- Visualize undo tree
      use "simnalamburt/vim-mundo"

      -- make xdc actually delete, and allow to introduce m for "move"
      use "svermeulen/vim-cutlass"

      -- Show register contents when needed
      use "tversteeg/registers.nvim"

      --- Auto-cwd to project root directory:
      -- https://github.com/ygm2/rooter.nvim
      -- g.rooter_pattern = {'.git'}
      -- use { 'ygm2/rooter.nvim' }
      -- https://github.com/dbakker/vim-projectroot
      use "dbakker/vim-projectroot"

      -- File explorer/tree
      -- use {"ms-jpq/chadtree", branch = "chad", run = ":CHADdeps"}
      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
          "kyazdani42/nvim-web-devicons" -- optional, for file icon
        },
        config = function()
          require "nvim-tree".setup {}
        end
      }
      g.nvim_tree_respect_buf_cwd = 1
      g.nvim_tree_add_trailing = 1
      g.nvim_tree_group_empty = 1
      g.nvim_tree_git_hl = 1

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
      use {
        "RRethy/nvim-treesitter-textsubjects",
        requires = "nvim-treesitter/nvim-treesitter"
      }
      -- treesitter textobject helper
      use "mfussenegger/nvim-ts-hint-textobject"

      -- Glow for markdown: https://github.com/npxbr/glow.nvim
      -- use {"npxbr/glow.nvim", branch = "main", run = ":GlowInstall"}

      -- LSP: https://github.com/neovim/nvim-lspconfig
      use {
        "neovim/nvim-lspconfig"
      }

      use {
        "williamboman/nvim-lsp-installer",
        requires = "neovim/nvim-lspconfig"
      }

      -- -- LSP Utils for actions
      -- use {
      --   "RishabhRD/nvim-lsputils",
      --   requires = "RishabhRD/popfix"
      -- }
      -- g.lsp_utils_location_opts = {
      --   mode = "editor"
      -- }

      -- -- FZF for LSP
      -- use {
      --   "ojroques/nvim-lspfuzzy",
      --   requires = {
      --     "junegunn/fzf",
      --     "junegunn/fzf.vim" -- to enable preview (optional)
      --   }
      --   -- config = function()
      --   --   require("lspfuzzy").setup {}
      --   -- end
      -- }

      -- use {
      --   "gfanto/fzf-lsp.nvim",
      --   requires = {
      --     "neovim/nvim-lspconfig"
      --   },
      --   config = function()
      --     require "fzf_lsp".setup()
      --   end
      -- }

      use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup({})
        end
      }

      -- use {
      --   "chengzeyi/fzf-preview.vim",
      --   requires = {
      --     "junegunn/fzf",
      --     "junegunn/fzf.vim"
      --   }
      -- }

      -- Improved fzf.vim written in lua https://github.com/ibhagwan/fzf-lua
      use {
        "ibhagwan/fzf-lua",
        requires = {
          "vijaymarupudi/nvim-fzf",
          "kyazdani42/nvim-web-devicons"
        }, -- optional for icons
        config = function()
          require "fzf-lua".setup {
            winopts = {
              preview = {
                -- default     = 'bat',           -- override the default previewer?
                -- default uses the 'builtin' previewer
                -- border = "border", -- border|noborder, applies only to
                -- native fzf previewers (bat/cat/git/etc)
                vertical = "down:60%", -- up|down:size
                horizontal = "right:60%", -- right|left:size
                layout = "vertical" -- horizontal|vertical|flex
                -- flip_columns = 120, -- #cols to switch to horizontal on flex
                -- Only valid with the builtin previewer:
                -- title = true, -- preview border title (file/buf)?
                -- applies only when scrollbar = 'border'
                -- winopts = {
                --   -- builtin previewer window options
                --   number = true,
                --   relativenumber = false,
                --   cursorline = true,
                --   cursorlineopt = "both",
                --   cursorcolumn = false,
                --   signcolumn = "no",
                --   list = false,
                --   foldenable = false,
                --   foldmethod = "manual"
                -- }
              }
            },
            previewers = {
              git_diff = {
                cmd = "git diff",
                args = "--color",
                pager = "delta --theme base16 --light" -- if you have `delta` installed
              }
            }
          }
        end
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
      use {"iberianpig/tig-explorer.vim", requires = "rbgrouleff/bclose.vim"}
      use "tpope/vim-fugitive"
      use "rhysd/git-messenger.vim"

      -- Bufferize command output (like :messages): https://github.com/AndrewRadev/bufferize.vim
      use "AndrewRadev/bufferize.vim"
      g.bufferize_command = "enew"
      g.bufferize_keep_buffers = 0

      -- HTTP client
      use {
        "NTBBloodbath/rest.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("rest-nvim").setup()
        end
      }
      -- Which key popup
      use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {}
        end
      }
      -- Black and White color scheme: https://github.com/pgdouyon/vim-yin-yang
      use "pgdouyon/vim-yin-yang"

      -- -- fast completion for nvim
      -- use {
      --   "ms-jpq/coq_nvim",
      --   branch = "coq",
      --   run = ":COQdeps"
      -- }
      -- use {"ms-jpq/coq.artifacts", branch = "artifacts"} -- 9000+ Snippets

      -- -- Autocompletion
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "neovim/nvim-lspconfig",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-vsnip",
          "hrsh7th/vim-vsnip"
        }

        -- config = function()
        --   require("completion")
        -- end
      }

      -- Autopairing: https://github.com/windwp/nvim-autopairs
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup(
            {
              fast_wrap = {},
              check_ts = true
              --   ts_config = {
              --     javascript = {"template_string"}
              --   }
            }
          )
        end
      }

      -- Tabbing out of pairs
      use {
        "abecodes/tabout.nvim",
        config = function()
          require("tabout").setup {
            tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            enable_backwards = true, -- well ...
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
              {open = "'", close = "'"},
              {open = '"', close = '"'},
              {open = "`", close = "`"},
              {open = "<", close = ">"},
              {open = "(", close = ")"},
              {open = "[", close = "]"},
              {open = "{", close = "}"}
            },
            ignore_beginning = true --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]],
            exclude = {} -- tabout will ignore these filetypes
          }
        end,
        requires = {"nvim-treesitter", "hrsh7th/nvim-cmp"} -- or require if not used so far
      }

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

      -- -- Manage comments: https://github.com/terrortylor/nvim-comment
      -- use {
      --   "terrortylor/nvim-comment",
      --   config = function()
      --     require("nvim_comment").setup()
      --   end
      -- }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
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
