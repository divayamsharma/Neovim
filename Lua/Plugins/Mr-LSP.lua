return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSPConfig setup
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",   -- Lua
          "pyright",  -- Python
          "html",     -- HTML
          "cssls",    -- CSS
          "ts_ls",    -- JavaScript/TypeScript
        },
        automatic_installation = true, -- Automatically install missing servers
      })
    end,
  },

  -- LSP Config setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Reusable on_attach function
      local on_attach = function(client, bufnr)
        -- Keybindings for LSP
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- Lua LSP setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }, -- Avoid "undefined global" for 'vim'
          },
        },
      })

      -- Pyright LSP setup
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- HTML LSP setup
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- CSS LSP setup
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- TypeScript/JavaScript LSP setup
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}

