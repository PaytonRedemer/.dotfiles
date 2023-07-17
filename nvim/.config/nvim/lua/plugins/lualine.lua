return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.opt.showmode = false
    vim.opt.cmdheight = 0
  end,

  opts = {},
}
