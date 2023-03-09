local function builtin(source)
  return function()
    require("telescope.builtin")[source]()
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    keys = {
      { "<leader>ff", builtin("find_files"), desc = "Files" },
      { "<leader>fg", builtin("live_grep"), desc = "Grep" },
      { "<leader>b",  builtin("buffers"), desc = "Buffers"},
      { "<leader>fh", builtin("help_tags"), desc = "Help"},
      { "<leader>fp", builtin("git_files"), desc = "Git" },
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },

    config = function()
      require("telescope").load_extension "file_browser"
    end,

    keys = {
      { "<leader>fb", ":Telescope file_browser<CR>", desc = "File browser"}
    }
  }
}
