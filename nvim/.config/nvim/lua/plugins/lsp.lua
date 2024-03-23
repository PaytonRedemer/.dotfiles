return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  cmd = "LspInfo",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("K", vim.lsp.buf.hover, "Hover")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype definition")
      nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
      nmap("gs", vim.lsp.buf.document_symbol, "[G]oto document [S]ymbol")
      nmap("gS", vim.lsp.buf.workspace_symbol, "[G]oto workspace [S]ymbol")
      nmap("<leader>ch", vim.lsp.buf.signature_help, "[C]ode signature [H]elp")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("<leader>cf", vim.lsp.buf.format, "[C]ode [F]ormat")
      nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
    end

    local servers = {
      "bashls",
      "clangd",
      "eslint",
      "ltex",
      "lua_ls",
      "nil_ls",
      "pyright",
      "rust_analyzer",
      "tsserver",
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    for _, server in ipairs(servers) do
      require("lspconfig")[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  end,
}
