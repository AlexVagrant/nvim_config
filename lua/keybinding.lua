local map = vim.keymap.set

-- basic
map("n", "<space>w", ":w<CR>", { desc = "保存文件" })
map("n", "<space>qq", ":qa<CR>", { desc = "退出所有" })

-- vim 移动快捷键
map("n", "<leader>/", ":nohlsearch<CR>", { desc = "清除高亮" })
-- 窗口切换
map("n", "<C-J>", "<C-W>j", { desc = "切换到下方窗口" })
map("n", "<C-K>", "<C-W>k", { desc = "切换到上方窗口" })
map("n", "<C-L>", "<C-W>l", { desc = "切换到右侧窗口" })
map("n", "<C-H>", "<C-W>h", { desc = "切换到左侧窗口" })
-- 标签页切换
map("n", "<S-H>", "gT", { desc = "上一个标签页" })
map("n", "<S-l>", "gt", { desc = "下一个标签页" })

map("n", "<leader>v", '"+gp', { desc = "粘贴剪贴板内容" })
map("n", "<leader>c", '"+y', { desc = "复制到剪贴板" })
map("n", "<leader>t", ':tabnew<CR>', { desc = "新建标签页" })
map("v", "<leader>c", '"+y', { desc = "复制到剪贴板" })


map("i", "jj", "<ESC>", { desc = "退出插入模式" })

--date
map("n", '<leader>rd', 'i<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>', { desc = "插入日期" })
map("i", '<leader>rd', '<C-R>=strftime("%Y-%m-%d %a")<CR>', { desc = "插入日期" })
-- time
map("n", '<leader>rt', 'i<C-R>=strftime("%H:%M:%S")<CR><Esc>', { desc = "插入时间" })
map("i", '<leader>rt', '<C-R>=strftime("%H:%M:%S")<CR>', { desc = "插入时间" })

--git
map('n', '<leader>gs', '<CMD>G<CR>', { desc = "Git Status" })
map('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', { desc = "打开并关闭 Git Status" })
map('n', '<leader>gw', '<CMD>Gwrite<CR>', { desc = "Git Add" })
map('n', '<leader>gr', '<CMD>Gread<CR>', { desc = "Git Checkout" })
map('n', '<leader>gh', '<CMD>diffget //2<CR>', { desc = "获取左侧差异" })
map('n', '<leader>gl', '<CMD>diffget //3<CR>', { desc = "获取右侧差异" })
map('n', '<leader>gp', '<CMD>Git push<CR>', { desc = "Git Push" })

-- Reload Neovim config
map('n', '<leader>R', ':source $MYVIMRC<CR>', { desc = "重载配置" })
