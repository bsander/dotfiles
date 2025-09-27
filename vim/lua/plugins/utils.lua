return {
  -- Auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' }, -- it will not add a pair on that treesitter node
          javascript = { 'template_string' },
          java = false,       -- don't check treesitter on java
        },
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey = 'Comment'
        },
      })

      -- Integration with nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup({
        pre_hook = function(ctx)
          -- Only calculate commentstring for tsx filetypes
          if vim.bo.filetype == 'typescriptreact' or vim.bo.filetype == 'javascriptreact' then
            local U = require('Comment.utils')

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
              location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
              key = type,
              location = location,
            })
          end
        end,
      })
    end,
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      -- Configuration flag - set to false to reduce which-key triggers
      local show_extended_triggers = true

      local triggers = {
        { "<leader>", mode = { "n", "v" } },
      }

      -- Add extended triggers if enabled
      if show_extended_triggers then
        vim.list_extend(triggers, {
          { "g", mode = { "n", "v" } },
          { "y", mode = { "n", "v" } },
          { "d", mode = { "n", "v" } },
          { "]", mode = { "n", "v" } },
          { "[", mode = { "n", "v" } },
          { "z", mode = { "n", "v" } },
          { "<C-w>", mode = { "n" } },
        })
      end

      wk.setup({
        delay = 100, -- Show which-key after this time
        triggers = triggers,
      })

      -- Register key mappings using modern spec
      wk.add({
        { "<leader>f", group = "file" },
        { "<leader>s", group = "search" },
        { "<leader>g", group = "git" },
        { "<leader>b", group = "buffer" },
        { "<leader>w", group = "window" },
        { "<leader>t", group = "toggle" },
        { "<leader>c", group = "code" },
        { "<leader>x", group = "text" },
        { "<leader>h", group = "help" },
        { "<leader>v", group = "vim" },
        { "<leader>l", group = "location" },
        { "<leader>m", group = "multicursor" },
        { "<leader>ma", desc = "Match add cursor" },
        { "<leader>mA", desc = "Match add all cursors" },
        { "<leader>ms", desc = "Match skip cursor" },
        { "<leader>mj", desc = "Add cursor below" },
        { "<leader>mk", desc = "Add cursor above" },
        { "<leader>mJ", desc = "Skip cursor below" },
        { "<leader>mK", desc = "Skip cursor above" },
        { "<leader>mt", desc = "Toggle cursor mode" },
      })

      -- Extended mappings shown only if enabled
      if show_extended_triggers then
        wk.add({
          { "g", group = "go/global" },
          { "]", group = "next" },
          { "[", group = "previous" },
          { "z", group = "fold/spell" },
          { "<C-w>", group = "window" },
        })
      end
    end,
  },

  -- Better vim.ui
  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  -- File operations
  {
    "tpope/vim-eunuch",
    cmd = { "Remove", "Delete", "Move", "Chmod", "Mkdir", "Cfind", "Clocate", "Lfind", "Wall", "SudoWrite", "SudoEdit" },
  },

  -- Remember last place
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require('nvim-lastplace').setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true
      })
    end,
  },

  -- Better increment/decrement
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end },
      { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v" },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v" },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v" },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      }
    end,
  },

  -- Highlight colors
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = false, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = false, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = "background", -- Set the display mode.
          tailwind = false, -- Enable tailwind colors
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
          always_update = false
        },
        buftypes = {},
      })
    end,
  },

  -- Git with Tig integration
  {
    "iberianpig/tig-explorer.vim",
    dependencies = { "rbgrouleff/bclose.vim" },
    keys = {
      { '<leader>gg', '<CMD>TigStatus<CR>', desc = 'Tig status' },
      { '<leader>gb', '<CMD>TigBlame<CR>', desc = 'Tig blame' },
    },
  },

  -- Better diagnostics (Trouble equivalent)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { '<leader>tq', '<CMD>Trouble diagnostics toggle<CR>', desc = 'Toggle diagnostics' },
      { '<leader>e', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer diagnostics' },
      { '<leader>E', '<CMD>Trouble diagnostics toggle<CR>', desc = 'Workspace diagnostics' },
    },
  },

  -- Undo tree (Mundo equivalent)
  {
    "mbbill/undotree",
    keys = {
      { '<leader>tu', '<CMD>UndotreeToggle<CR>', desc = 'Toggle undo tree' },
    },
  },

  -- Interactive swapping (ISwap equivalent)
  {
    "mizlan/iswap.nvim",
    keys = {
      { '<leader>xC', '<CMD>ISwap<CR>', desc = 'Interactive swap' },
      { '<leader>xc', '<CMD>ISwapWith<CR>', desc = 'Interactive swap with' },
    },
  },

  -- Buffer utilities
  {
    "famiu/bufdelete.nvim",
    keys = {
      { '<Leader>bd', '<CMD>Bdelete<CR>', desc = 'Delete buffer (keep window)' },
      { '<Leader>bD', '<CMD>Bdelete!<CR>', desc = 'Force delete buffer' },
    },
  },

  -- Bufferize - capture command output in buffer
  {
    "AndrewRadev/bufferize.vim",
    cmd = { "Bufferize" },
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
}
