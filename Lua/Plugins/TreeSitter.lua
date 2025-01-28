-- Treesitter Plugin setup
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically update Treesitter parsers
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { 
          "python", "html", "javascript", "css", 
          "lua", "vim", "vimdoc", "query", 
          "markdown", "markdown_inline" 
        },

        -- Automatically install missing parsers when entering buffer
        auto_install = true,  -- This ensures parsers are installed automatically when needed

        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024  -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
}

