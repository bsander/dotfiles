local prettier = function()
  return {
    exe = "./node_modules/.bin/prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
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
        prettier
      },
      javascript = {
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
  autocmd BufWritePost *.js,*.rs,*.lua silent! FormatWrite
augroup END
]],
  true
)
