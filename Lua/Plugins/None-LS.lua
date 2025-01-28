return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Formatters
          null_ls.builtins.formatting.prettier,   -- Prettier for JS/TS/HTML/CSS
          null_ls.builtins.formatting.black,      -- Black for Python

          -- Linters
          null_ls.builtins.diagnostics.eslint,    -- ESLint for JS/TS
          null_ls.builtins.diagnostics.shellcheck, -- ShellCheck for shell scripts
        },
      })
      vim.keymap.set('n', '<C-s>', vim.lsp.buf.format, {})
    end
  },
}

