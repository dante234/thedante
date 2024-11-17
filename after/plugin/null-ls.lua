local null_ls = require("null-ls")

null_ls.setup({
    sources = {
    null_ls.builtins.formatting.prettier.with({
              filetypes = { "javascript", "typescript", "html", "css", "markdown", "json" },
              extra_args = { "--prose-wrap", "always", "--print-width", "80" },
          }),
    },
})

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.md,*.json,*.js,*.ts lua vim.lsp.buf.format({ async = true })
  augroup END
]])
