-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { result, "WarningMsg" }
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



-- Setup lazy.nvim and load plugins
require("lazy").setup({
  spec = {
    { import = "Plugins" },  -- Import custom plugins from Lua/Plugins directory

  },
  -- Global configuration options
  install = { colorscheme = { "habamax" } },  -- Install with a default colorscheme
  checker = { enabled = true },  -- Auto-check for plugin updates
})



