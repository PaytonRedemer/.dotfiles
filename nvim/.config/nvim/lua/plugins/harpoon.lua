return {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  keys = {
    { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add Harpoon [M]ark" },
    { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[E]plore harpoon" },
    { "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show Harpoon" },
    { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon buffer [1]" },
    { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon buffer [2]" },
    { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon buffer [3]" },
    { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon buffer [4]" },
    { "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon buffer [5]" },
    { "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon buffer [6]" },
    { "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon buffer [7]" },
    { "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon buffer [8]" },
    { "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Harpoon buffer [9]" },
  },
}
