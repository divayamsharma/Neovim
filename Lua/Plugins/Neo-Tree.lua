-- Hello I am Neo-Tree your FILE-Explorer for Neovim
return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        -- Quickly search for files in your project.--
        vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
  end
}
