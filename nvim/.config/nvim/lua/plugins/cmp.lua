local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
  -- Sources
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
}

M.event = "InsertEnter"

function M.config()
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp", keyword_length = 2 },
      { name = "luasnip", keyword_length = 2 },
      { name = "buffer", keyword_length = 3 },
      { name = "path" },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = "LSP",
          luasnip = "LuaSnip",
          buffer = "Buffer",
          path = "Path",
        }

        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    mapping = {
      ["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<Down>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.confirm({ select = true }),

      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
    },
  })
end

return M
