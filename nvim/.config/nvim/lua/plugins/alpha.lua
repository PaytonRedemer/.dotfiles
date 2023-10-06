return {
  "goolord/alpha-nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  enabled = false,
  event = "VimEnter",
  config = function()
    require("alpha").setup(require("alpha.themes.startify").config)
  end,
}
