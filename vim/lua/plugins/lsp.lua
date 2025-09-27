return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- LSP settings
      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Custom LSP mappings (preserving old workflow)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        -- Use telescope for better LSP navigation (with fallback to built-in)
        local has_telescope, telescope = pcall(require, 'telescope.builtin')

        if has_telescope then
          vim.keymap.set('n', 'gd', telescope.lsp_definitions, bufopts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
          vim.keymap.set('n', 'gi', telescope.lsp_implementations, bufopts)
          vim.keymap.set('n', 'gt', telescope.lsp_type_definitions, bufopts)
          vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
          vim.keymap.set('n', 'g.', vim.lsp.buf.code_action, bufopts)
          vim.keymap.set('n', 'g;', telescope.lsp_document_symbols, bufopts)
          vim.keymap.set('n', 'g/', telescope.lsp_workspace_symbols, bufopts)
        else
          -- Fallback to built-in LSP functions
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
          vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          vim.keymap.set('n', 'g.', vim.lsp.buf.code_action, bufopts)
        end

        -- Traditional LSP mappings for hover and rename
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)          -- Show hover information
        vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, bufopts) -- Signature help
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)         -- Rename

        -- Workspace management
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)

        -- Format
        vim.keymap.set('n', '<Leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      -- Setup mason
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'pyright',
          'bashls',
          'jsonls',
          'yamlls',
        },
      })

      -- Configure individual language servers using vim.lsp.config
      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }

      vim.lsp.config.ts_ls = {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
        root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.pyright = {
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.bashls = {
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'sh', 'bash' },
        root_markers = { '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.jsonls = {
        cmd = { 'vscode-json-language-server', '--stdio' },
        filetypes = { 'json', 'jsonc' },
        root_markers = { 'package.json', '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.yamlls = {
        cmd = { 'yaml-language-server', '--stdio' },
        filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab' },
        root_markers = { '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.gh_actions_ls = {
        cmd = { 'gh-actions-language-server', '--stdio' },
        filetypes = { 'yaml.github' },
        root_markers = { '.git', '.github' },
        single_file_support = true,
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Configuration file editing keybindings
      vim.keymap.set('n', '<leader>ve', function()
        local dotfiles = vim.env.DOTFILES or vim.fn.expand('~/.config/nvim')
        local has_telescope, telescope = pcall(require, 'telescope.builtin')
        if has_telescope then
          telescope.find_files({ cwd = dotfiles })
        else
          vim.cmd('edit ' .. dotfiles)
        end
      end, { desc = 'Edit vim config' })

      vim.keymap.set('n', '<leader>vs', '<CMD>write<CR><CMD>source %<CR>', { desc = 'Source current file' })
      vim.keymap.set('n', '<leader>vr', function()
        vim.cmd('write')
        -- Clear lua module cache to force complete reload
        for name, _ in pairs(package.loaded) do
          if name:match('^config') or name:match('^plugins') then
            package.loaded[name] = nil
          end
        end
        vim.cmd('source $MYVIMRC')
        vim.cmd('Lazy reload')
        print("Config reloaded from scratch")
      end, { desc = 'Reload neovim config from scratch' })
      vim.keymap.set('n', '<leader>vi', '<CMD>Lazy install<CR>', { desc = 'Install plugins' })
      vim.keymap.set('n', '<leader>vu', '<CMD>Lazy sync<CR>', { desc = 'Update plugins' })
    end
  },
}
