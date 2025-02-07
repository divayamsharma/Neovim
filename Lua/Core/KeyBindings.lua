-- Turn on NumberLine on Left
vim.opt.number = true
vim.opt.relativenumber = false -- Optional: enables relative line numbers

----------------------------------------------------------------------------------------------------
-- 🛠️ UI and Behavior Settings 🛠️
vim.opt.backspace = '2'        -- Allow backspace over everything in insert mode
vim.opt.showcmd = true         -- Show (partial) command in the status line while typing
vim.opt.cursorline = true      -- Highlight the current line the cursor is on for better visibility
vim.opt.laststatus = 2         -- Always show the status line (1 = only in window with focus, 2 = always)
vim.opt.autowrite = true       -- Automatically save the file when switching buffers
vim.opt.autoread = true        -- Automatically reload the file if it changes outside of Neovim
----------------------------------------------------------------------------------------------------

-- ✨ Indentation and Whitespace Settings ✨
vim.opt.tabstop = 2            -- Set the number of spaces for a tab character (2 spaces per tab)
vim.opt.shiftwidth = 2         -- Set the number of spaces for each indentation level
vim.opt.shiftround = true      -- Round indentation to the nearest multiple of shiftwidth
vim.opt.expandtab = true       -- Use spaces instead of tabs for indentation

-- Autocommand to set 4 spaces for Python files
vim.cmd([[
  augroup PythonIndentation
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  augroup END
]])
----------------------------------------------------------------------------------------------------
-- 🔑 Quick Commands 🔑
-- Keybinding to remove search highlights (press 'Leader + h')
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-l>', ':w<CR>', {noremap = true, silent = true})

----------------------------------------------------------------------------------------------------
-- 🔑 Key Bindings 🔑

-- toggle clipboard On and OFF

-- "9" Go to the start of the line (Normal Mode)
vim.keymap.set('n', '9', '0', {noremap = true, silent = true})

-- "0" Go to the end of the line (Normal Mode)
vim.keymap.set('n', '0', '$', {noremap = true, silent = true})

-- "yy" to copy to clipboard in Visual mode
vim.keymap.set('v', 'yy', '"+y', {noremap = true, silent = true})

-- "p" to paste from clipboard to neovim
vim.opt.clipboard = "unnamedplus"

-- Option+Right: Move to next word
vim.keymap.set('i', '<A-Right>', '<C-o>w', {noremap = true, silent = true})

-- Option+Left: Move to previous word
vim.keymap.set('i', '<A-Left>', '<C-o>b', {noremap = true, silent = true})
----------------------------------------------------------------------------------------------------
-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "_", "<C-x>")



