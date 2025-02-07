
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 🛠️ Setup Dap UI
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- 🔍 Use LLDB for Debugging (MacOS)
    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- ✅ Corrected path for LLDB-DAP
      name = "lldb"
    }

    -- 🖥️ Debug Configuration for C
    dap.configurations.c = {
      {
        name = "Launch C Program",
        type = "lldb",
        request = "launch",
        
        -- 🔥 Auto-detect compiled executable

        program = function()
          local cwd = vim.fn.getcwd()
          local exe = vim.fn.glob(cwd .. "/*", false, true)

          -- 🔍 Find the first executable file (ignore directories and source files)
          for _, file in ipairs(exe) do
            if vim.fn.executable(file) == 1 then
              return "./" .. vim.fn.fnamemodify(file, ":t") -- ✅ Use relative path
            end
          end

          -- ❓ If nothing found, fallback to manual input
          return vim.fn.input('Path to executable: ', './', 'file')
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        args = {},
      },
    }

    -- ⌨️ Debugging Keybindings
    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {}) -- 🔴 Toggle breakpoint
    vim.keymap.set('n', '<Leader>bb', dap.continue, {})         -- ▶️ Continue execution
    vim.keymap.set('n', '<Leader>si', dap.step_into, {})        -- ⬇️ Step into function
    vim.keymap.set('n', '<Leader>so', dap.step_over, {})        -- ⏭️ Step over function
    vim.keymap.set('n', '<Leader>su', dap.step_out, {})         -- ⬆️ Step out of function
  end
}

