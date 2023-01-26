return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  config = function ()
    require('lualine').setup()
    vim.opt.showmode = false
  end
}
