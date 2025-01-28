-- Install and co


return {
  "ngtuonghy/live-server-nvim",
  event = "VeryLazy",
  build = ":LiveServerInstall",
  config = function()
    require("live-server-nvim").setup({
      custom = {
        "--no-css-inject",
      },
      serverPath = vim.fn.stdpath("data") .. "/live-server/",
      open = "folder",
    })

    -- Automatically open Chrome after starting the server
    vim.api.nvim_create_autocmd("User", {
      pattern = "LiveServerStartPost",
      callback = function()
        local url = "http://127.0.0.1:8080"
        os.execute('open -a "Google Chrome" ' .. url)
      end,
    })

    -- Keybinding to toggle the Live Server
    vim.api.nvim_set_keymap("n", "<leader>xx", ":LiveServerToggle<CR>", { noremap = true, silent = true })
  end,
}

--HACK: Liver Server Shortcuts
-- LiveServerStart -- Run server
-- LiveServerStart -f -- Serve the currently open file (Note: for this to work, `open` mode in setup must be set -- to "folder")
-- LiveServerStop -- Stop server
-- LiveServerToggle -- Toggle server
