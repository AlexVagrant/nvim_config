
local opt = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap

-- basic
map("n", "<space>w", ":w<CR>", opt)
map("n", "<space>qq", ":qa<CR>", opt)

-- vim 移动快捷键
map("n", "<leader>/", ":nohlsearch<CR>", opt)
-- 窗口切换
map("n", "<C-J>", "<C-W>j", opt)
map("n", "<C-K>", "<C-W>k", opt)
map("n", "<C-L>", "<C-W>l", opt)
map("n", "<C-H>", "<C-W>h", opt)
-- 标签页切换
map("n", "<S-H>", "gT", opt)
map("n", "<S-l>", "gt", opt)

map("n", "<leader>v", '"+gp', opt)
map("n", "<leader>c", '"+y', opt)
map("n", "<leader>t", ':tabnew<CR><C-E>', opt)

map("i", "jj", "<ESC>", opt)

--date 
map("n", '<leader>rd', 'i<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>', opt)
map("i", '<leader>rd', '<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>', opt)
-- time 
map("n", '<leader>rt', 'i<C-R>=strftime("%H:%M:%S")<CR><Esc>', opt)
map("i", '<leader>rt', '<C-R>=strftime("%H:%M:%S")<CR><Esc>', opt)

--git
map('n', '<leader>gs', '<CMD>G<CR>', opt)
map('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', opt)
map('n', '<leader>gw', '<CMD>Gwrite<CR>', opt)
map('n', '<leader>gr', '<CMD>Gread<CR>', opt)
map('n', '<leader>gh', '<CMD>diffget //2<CR>', opt)
map('n', '<leader>gl', '<CMD>diffget //3<CR>', opt)
map('n', '<leader>gp', '<CMD>Git push<CR>', opt)

-- Reload Neovim config
map('n', '<leader>R', ':source $MYVIMRC<CR>', opt)