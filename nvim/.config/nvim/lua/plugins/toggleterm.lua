return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
    keys = {
      {"<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal"},
    },
  }
}
