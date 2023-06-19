return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },

    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        }
      }
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("file_browser")
   end,

    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>b",  "<cmd>Telescope buffers<cr>", desc = "Buffers"},
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help"},
      { "<leader>fp", "<cmd>Telescope git_files<cr>", desc = "Git" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },

    keys = {
      { "<leader>fb", ":Telescope file_browser<CR>", desc = "File browser"}
    }
  }
}
