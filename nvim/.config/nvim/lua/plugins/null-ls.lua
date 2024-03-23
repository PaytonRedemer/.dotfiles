return {
  "nvimtools/none-ls.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local null_ls = require("null-ls")
    return {
      sources = {
        -- General
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.proselint,

        -- Git
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.gitlint,

        -- C
        null_ls.builtins.formatting.clang_format,

        -- Shell
        null_ls.builtins.formatting.shfmt,

        -- Python
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,

        -- Lua
        null_ls.builtins.formatting.stylua,
      },
    }
  end,
}
