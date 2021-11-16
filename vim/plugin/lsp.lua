local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

-- vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
-- vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
-- vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
-- vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
-- vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
-- vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
-- vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler

vim.lsp.handlers["textDocument/codeAction"] = require "fzf_lsp".code_action_handler
vim.lsp.handlers["textDocument/definition"] = require "fzf_lsp".definition_handler
vim.lsp.handlers["textDocument/declaration"] = require "fzf_lsp".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require "fzf_lsp".type_definition_handler
vim.lsp.handlers["textDocument/implementation"] = require "fzf_lsp".implementation_handler
vim.lsp.handlers["textDocument/references"] = require "fzf_lsp".references_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require "fzf_lsp".document_symbol_handler
vim.lsp.handlers["workspace/symbol"] = require "fzf_lsp".workspace_symbol_handler
vim.lsp.handlers["callHierarchy/incomingCalls"] = require "fzf_lsp".incoming_calls_handler
vim.lsp.handlers["callHierarchy/outgoingCalls"] = require "fzf_lsp".outgoing_calls_handler

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false
  }
)

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

-- local tsconfig = require "lspinstall/util".extract_config("tsserver")
-- tsconfig.default_config.cmd[1] = "./node_modules/.bin/typescript-language-server"
-- tsconfig.default_config.cmd[3] = "--tsserver-path=node_modules/.bin/tsserver"
-- -- print(vim.inspect(tsconfig))
-- require "lspinstall/servers".typescript = tsconfig

-- -- specify the path from where to look for the graphql config
-- tsconfig.default_config.on_new_config = function(new_config, new_root_dir)
--   local new_cmd = vim.deepcopy(tsconfig.default_config.cmd)
--   table.insert(new_cmd, "---tsserver-path=node_modules/.bin/tsserver")
--   new_config.cmd = new_cmd
--   print(vim.inspect(new_config))
-- end

local server_setups = {}

-- require "lspinstall".setup()
-- local servers = require "lspinstall".installed_servers()
-- for _, server in pairs(servers) do
--   if server_setups[server] then
--     require "lspconfig"[server].setup(coq.lsp_ensure_capabilities(server_setups[server]))
--   else
--     require "lspconfig"[server].setup(coq.lsp_ensure_capabilities({}))
--   end
-- end

lsp_installer.on_server_ready(
  function(server)
    local opts = server_setups[server.name] or {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    -- server:setup(coq.lsp_ensure_capabilities(opts))

    opts.capabilities = capabilities
    server:setup(opts)
  end
)
