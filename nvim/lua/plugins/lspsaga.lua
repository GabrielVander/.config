if true then return {} end

return {
  "kkharji/lspsaga.nvim",
  config = function() require("lspsaga").setup {} end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    -- "nvim-tree/nvim-web-devicons", -- optional
  },
}
