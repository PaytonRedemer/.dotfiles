return {
  "jay-babu/mason-null-ls.nvim",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "cspell",
        "proselint",
        "alex",
        "mypy",
        "black",
        "shellcheck",
        "stylua",
      },
      automatic_installation = true,
    })


    local null_ls = require("null-ls")
    require("null-ls").setup({
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
      }
    })
  end
}
