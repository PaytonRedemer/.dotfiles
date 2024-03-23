return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  -- Only load if not using nix
  cond = not (vim.fn.executable("nixos-rebuild") == 1),
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {},
    },
  },
  opts = {
    ensure_installed = {
      -- lsp
      "bash-language-server",
      "clangd",
      "eslint-lsp",
      "ltex-ls",
      "lua-language-server",
      -- "nil", -- this builds with cargo... just install with nix
      "pyright",
      "rust-analyzer",
      "typescript-language-server",
      -- null-ls
      "proselint",
      "alex",
      "codespell",
      "commitlint",
      "gitlint",
      "clang-format",
      "shfmt",
      "mypy",
      "black",
      "stylua",
    },
  },
}
