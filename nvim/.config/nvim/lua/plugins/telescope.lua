return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  cmd = "Telescope",
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
    },
  },
  keys = {
    { "<leader>:",  "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>/",  "<cmd>Telescope live_grep<cr>",                 desc = "Grep" },
    { "<leader>b",  "<cmd>Telescope buffers<cr>",                   desc = "[B]uffers" },
    { "<C-p>",      "<cmd>Telescope git_files<cr>",                 desc = "[P]roject files" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "[F]ind [B]uffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "[F]ind [F]iles" },
    { "<leader>fp", "<cmd>Telescope git_files<cr>",                 desc = "[F]ind [P]roject files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "[F]ind [R]ecent files" },
    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "[S]earch [A]uto commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[S]earch [B]uffers" },
    { "<leader>sc", "<cmd>Telescope commands<cr>",                  desc = "[S]earch [C]ommands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",       desc = "[S]earch document [D]iagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>",               desc = "[S]earch workspace [D]iagnostics" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>",                 desc = "[S]earch [G]rep" },
    { "<leader>sG", "<cmd>Telescope grep_string<cr>",               desc = "[S]earch [G]rep string" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "[S]earch [H]elp" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "[S]earch [H]ighlight groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "[S]earch [K]eymaps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "[S]earch [M]arks" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "[S]earch [M]an pages" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "[S]earch [O]ptions" },
    { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>",      desc = "[S]earch document [S]ymbols" },
    -- git
    { "<leader>gb", "<cmd>Telescope git_branches<CR>",              desc = "[G]it [B]ranches" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "[G]it [C]ommits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "[G]it [S]tatus" },
    -- ui
    { "<leader>uc", "<cmd>Telescope colorscheme<CR>",               desc = "[U]i [C]olorscheme" },
  },
}
