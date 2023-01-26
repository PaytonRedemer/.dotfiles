return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  keys = {
      { "<leader>x", "<cmd>NvimTreeToggle<CR>", desc = "Toggle tree" },
  },

  config = function()
    require("nvim-tree").setup()

  end
}
