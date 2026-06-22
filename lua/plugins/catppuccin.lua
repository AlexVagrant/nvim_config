return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      transparent_background = true,
      integrations = {
        alpha = true,
        telescope = true,
        nvimtree = true,
        treesitter = true,
        which_key = true,
        mason = true,
      },
    })
  end,
}
