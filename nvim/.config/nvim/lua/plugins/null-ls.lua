return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.cspell,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.stylua,
      },
    })

    return {
      ensure_installed = nil,
      automatic_installation = true,
    }
  end,
}
