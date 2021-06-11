vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true
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

local tsconfig = require "lspinstall/util".extract_config("tsserver")
tsconfig.default_config.cmd[1] = "./node_modules/.bin/typescript-language-server"
tsconfig.default_config.cmd[3] = "--tsserver-path=node_modules/.bin/tsserver"
-- print(vim.inspect(tsconfig))
require "lspinstall/servers".typescript = tsconfig

-- -- specify the path from where to look for the graphql config
-- tsconfig.default_config.on_new_config = function(new_config, new_root_dir)
--   local new_cmd = vim.deepcopy(tsconfig.default_config.cmd)
--   table.insert(new_cmd, "---tsserver-path=node_modules/.bin/tsserver")
--   new_config.cmd = new_cmd
--   print(vim.inspect(new_config))
-- end

local server_setups = {
  -- typescript = tsconfig,
  efm = {
    settings = {
      languages = {
        javascript = {eslint},
        javascriptreact = {eslint},
        ["javascript.jsx"] = {eslint},
        typescript = {eslint},
        ["typescript.tsx"] = {eslint},
        typescriptreact = {eslint}
      }
    },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescript.tsx",
      "typescriptreact"
    }
  }
}

require "lspinstall".setup()
local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
  if server_setups[server] then
    require "lspconfig"[server].setup(server_setups[server])
  else
    require "lspconfig"[server].setup({})
  end
end
