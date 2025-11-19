vim.g.mapleader = ","
vim.opt.termguicolors = true

require("lazy_conf")
require('keybinding')

vim.cmd[[colorscheme sonokai]]

-- 设置透明背景（适用于所有主题）
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  end,
})

-- 立即应用透明背景
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')


local set = vim.opt
set.hidden = true
set.number = true
set.encoding = "UTF-8"
--
-- if macunix{
-- 开始折叠
set.foldenable = true;
-- 用缩进表示折叠
set.foldmethod = "indent"
-- 打开文件是默认不折叠代码
set.foldlevelstart = 99
--zc      折叠
--zC     对所在范围内所有嵌套的折叠点进行折叠
--zo      展开折叠
--zO     对所在范围内所有嵌套的折叠点展开
--[z       到当前打开的折叠的开始处。
--]z       到当前打开的折叠的末尾处。
--zj       向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
--zk      向上移动到前一折叠的结束处。关闭的折叠也被计入。
-- }

set.ruler = true      -- 打开状态栏标尺
set.hlsearch = true   -- 搜索时高亮显示被找到的文本
--set.showmatch = true
set.cursorline = true -- 高亮当前行

-- set.background="dark" -- 黑色
-- set.background = "light" -- 白色

-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 相对数字
vim.o.relativenumber = true

vim.opt.wrap = true

