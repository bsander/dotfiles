return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<esc>'] = require('telescope.actions').close,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
          },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            ".DS_Store",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Telescope live_grep in git root
      local function find_git_root()
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_dir
        local cwd = vim.fn.getcwd()
        if current_file == "" then
          current_dir = cwd
        else
          current_dir = vim.fn.fnamemodify(current_file, ":h")
        end

        local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
        if vim.v.shell_error ~= 0 then
          return cwd
        end
        return git_root
      end

      local function live_grep_git_root()
        local git_root = find_git_root()
        if git_root then
          require('telescope.builtin').live_grep({
            search_dirs = { git_root },
          })
        end
      end

      vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      local function telescope_live_grep_open_files()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end
      vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
      vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

      -- Keep your existing keybindings
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help tags' })
      
      -- Additional file operations from old config
      vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Recent files (cwd)' })
      vim.keymap.set('n', '<leader>fR', require('telescope.builtin').oldfiles, { desc = 'Recent files (all)' })
      vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix, { desc = 'Quickfix list' })
      vim.keymap.set('n', '<leader>fl', require('telescope.builtin').loclist, { desc = 'Location list' })
      
      -- Commands and help
      vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').command_history, { desc = 'Command history' })
      vim.keymap.set('n', '<leader>hh', require('telescope.builtin').help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '::', require('telescope.builtin').commands, { desc = 'Commands' })
      vim.keymap.set('n', '<leader>hb', require('telescope.builtin').keymaps, { desc = 'Keymaps' })
      
      -- Bufferize keymaps for verbose output
      vim.keymap.set('n', '<leader>hm', '<CMD>Bufferize verbose map<CR><CMD>wincmd p<CR>', { desc = 'List all normal mode maps' })
      vim.keymap.set('n', '<leader>hi', '<CMD>Bufferize verbose imap<CR><CMD>wincmd p<CR>', { desc = 'List all insert mode maps' })
      
      -- Buffer navigation
      vim.keymap.set('n', '<leader><Tab>', require('telescope.builtin').buffers, { desc = 'Buffers' })
      
      -- Search operations
      vim.keymap.set('n', '<leader>;', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Search in buffer' })
      vim.keymap.set('n', 'g*', require('telescope.builtin').grep_string, { desc = 'Search word under cursor' })
      
      -- Toggles
      vim.keymap.set('n', '<leader>tc', require('telescope.builtin').colorscheme, { desc = 'Colorschemes' })
      vim.keymap.set('n', '<leader>tf', require('telescope.builtin').filetypes, { desc = 'Filetypes' })
    end,
  },
}