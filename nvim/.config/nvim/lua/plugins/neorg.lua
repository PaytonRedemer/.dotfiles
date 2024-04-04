return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  version = "v7.0.0", -- pin to version that doesn't require luarocks
  -- tag = "*",
  lazy = true,   -- enable lazy load
  ft = "norg",   -- lazy load on file type
  cmd = "Neorg", -- lazy load on command
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              neorg = "~/Documents/neorg",
            },
            default_workspace = "neorg",
          },
        },
        ["core.summary"] = {},
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              keybinds.map("norg", "n", "<LocalLeader>r", "<cmd>Neorg return<CR>")
            end,
          },
        },
      },
    }
  end,
  keys = {
    { "<leader>ni", "<cmd>Neorg index<cr>", desc = "[N]eorg [I]ndex" },
  },
}
