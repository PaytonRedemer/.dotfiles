local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",
}

function M.config()
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = {buffer = bufnr, remap = false}
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>mv", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

      -- TODO: Add more lsp keybindings and/or update current
      -- maybe add telescope stuff
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    end
  })

  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = {
      'clangd',
      'pyright',
      'bashls',
      'tsserver',
      'eslint',
      'lua_ls',
      'rust_analyzer',
    }
  })

  local lspconfig = require('lspconfig')
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  require('mason-lspconfig').setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
  })
end

return M
