
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = {
      enabled = true,
      char = "│",
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- Uncomment the line below to enable wrap for notifications
        wo = { wrap = true }
      }
    },
    -- Adding the dim configuration here
    dim = {
      scope = {
        min_size = 15,
        max_size = 25,
        siblings = true,
      },
      animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        easing = "outQuad",
        duration = {
          step = 20, -- ms per step
          total = 300, -- maximum duration
        },
      },
      filter = function(buf)
        return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
      end,
    },
    -- Add the zen configuration here
    zen = {
      toggles = {
        dim = true,
        git_signs = false,
        mini_diff_signs = false,
      },
      show = {
        statusline = true, -- can only be shown when using the global statusline
        tabline = false,
      },
      win = { style = "zen" },
      -- Callback when the window is opened
      on_open = function(win) end,
      -- Callback when the window is closed
      on_close = function(win) end,
      zoom = {
        -- Adding the new configuration block for the zoom window
        toggles = {},
        show = { statusline = true, tabline = true },
        win = {
          enter = true,
          fixbuf = true,
          minimal = true,
          width = 0.75,
          height = 0,
          backdrop = { transparent = true, blend = 0.90 },
          keys = { q = false },
          zindex = 100,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
        },
        -- Adding your custom block for the zoom window
        text = "▍ zoom  󰊓  ",
        minimal = true,
        enter = false,
        focusable = true,
        height = 1,
        row = 0,
        col = -1,
        backdrop = { transparent = true, blend = 0.90 },  -- Adjust the blend value for a darker background
      },
    },
  },
  keys = {
    -- Zen and Scratch Buffers
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

    -- Notifications
    { "<leader>h",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

    -- Buffers and Files
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },

    -- Git Integration
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },

    -- Terminal
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end, desc = "Ignore" },

    -- Word Navigation
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Previous Reference", mode = { "n", "t" } },

    -- News Window
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Global Debugging Helpers
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd -- Override print

        -- Toggle Mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>cn")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("lnn")
        Snacks.toggle.option("conceallevel", {
          off = 0,
          on = vim.o.conceallevel > 1 and vim.o.conceallevel or 2,
        }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", {
          off = "light",
          on = "dark",
          name = "Dark Background",
        }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<C-d>")
      end,
    })
  end,
}

