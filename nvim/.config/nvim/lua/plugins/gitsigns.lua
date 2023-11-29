return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      local gs = package.loaded.gitsigns
      map("n", "[h", gs.prev_hunk, "Previous hunk")
      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "<leader>ghs", gs.stage_hunk, "[G]it [H]unk [S]tage")
      map("n", "<leader>ghr", gs.reset_hunk, "[G]it [H]unk [R]eset")
      map("v", "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "[G]it [H]unk [S]tage")
      map("v", "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "[G]it [H]unk [R]eset")
      map("n", "<leader>ghS", gs.stage_buffer, "[G]it [H]unk [S]tage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "[G]it [H]unk [U]ndo Stage")
      map("n", "<leader>ghR", gs.reset_buffer, "[G]it [H]unk [R]eset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "[G]it [H]unk [P]review")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "[G]it [B]lame line")
      map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff this")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "[G]it [D]iff this ~")
      map("n", "<leader>ub", gs.toggle_current_line_blame, "[U]i [B]lame line")
      map("n", "<leader>us", gs.toggle_signs, "[U]i toggle git [S]igns")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "inner hunk")
    end,
  },
}
