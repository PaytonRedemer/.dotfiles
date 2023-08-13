return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.opt.showmode = false
    vim.opt.cmdheight = 1
  end,
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1 },
      },
      lualine_x = { "" },
      lualine_y = { "diagnostics" },
      lualine_z = { "location" },
    },
  },
}
