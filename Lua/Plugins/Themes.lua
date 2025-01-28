--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin", -- Optional: Define a custom name
    priority = 1000,     -- Load this plugin with high priority
    config = function()
      require("catppuccin").setup({
        flavour = "Mocha", -- Options: latte, frappe, macchiato, mocha
      })
      vim.cmd("colorscheme catppuccin") -- Apply the colorscheme
    end,
  },
}
