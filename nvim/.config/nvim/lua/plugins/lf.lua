return {
  "lmburns/lf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "akinsho/toggleterm.nvim",
  },
  cmd = "Lf",
  opts = {
    winblend = 0,
    border = "rounded",
    escape_quit = true,
  },
  keys = {
    { "<leader>fl", "<cmd>Lf<cr>", desc = "[F]ind file [L]f" },
  },
}
