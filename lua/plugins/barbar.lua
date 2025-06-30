
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0',
  config = function ()
    local map = vim.api.nvim_set_keymap
    local opt = { noremap = true, silent = true }
    map("n", "<space>h", ":BufferPrevious<CR>", opt)
    map("n", "<space>l", ":BufferNext<CR>", opt)
    map("n", "<space>c", ":BufferClose<CR>", opt)
    map("n", "<leader>bc", ":bdelete!<CR>", opt)
    map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
    map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
    map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
    map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
  end
}
