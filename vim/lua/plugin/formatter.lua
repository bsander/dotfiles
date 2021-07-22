local prettier = function()
  return {
    exe = "./node_modules/.bin/prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local eslint_d = function()
  return {
    exe = "eslint_d",
    args = {"--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix-to-stdout"},
    stdin = true
  }
end
local luafmt = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

local rustfmt = function()
  return {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      typescript = {
        -- eslint_d,
        prettier
      },
      typescriptreact = {
        prettier
      },
      javascript = {
        prettier
      },
      javascriptreact = {
        prettier
      },
      rust = {
        rustfmt
      },
      lua = {
        luafmt
      }
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua silent! FormatWrite
augroup END
]],
  true
)
-- autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua silent! FormatWrite
