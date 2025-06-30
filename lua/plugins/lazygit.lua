
return {
  "kdheepak/lazygit.nvim",
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  config = function ()
    local map = vim.api.nvim_set_keymap
    local opt = { noremap = true, silent = true }
    map("n", "<leader>gg", ":LazyGit<CR>", opt)
  end
}
