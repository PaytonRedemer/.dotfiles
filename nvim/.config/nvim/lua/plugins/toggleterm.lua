return {
  "akinsho/toggleterm.nvim",

  config = function()
    require("toggleterm").setup()

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
    -- vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
    vim.keymap.set("t", "<leader><ESC>", "<cmd>ToggleTerm<CR>")
  end
}
