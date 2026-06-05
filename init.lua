vim.g.mapleader = ","
vim.opt.termguicolors = true

-- Neovim 0.12+ 内置 LSP 自动补全
vim.o.autocomplete = true

-- 系统依赖检查（新设备首次启动时提示缺少哪些工具）
local deps_ok = require('check_deps').check()

require("lazy_conf")

-- 自动更新 Lazy 和 Mason（每天一次）
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local cache_dir = vim.fn.stdpath("cache")
    local last_update_file = cache_dir .. "/lazy_mason_update"

    local function should_update()
      local f = io.open(last_update_file, "r")
      if not f then return true end
      local last_date = f:read("*a")
      f:close()
      local today = os.date("%Y-%m-%d")
      return last_date ~= today
    end

    local function mark_updated()
      local f = io.open(last_update_file, "w")
      if f then
        f:write(os.date("%Y-%m-%d"))
        f:close()
      end
    end

    if should_update() then
      vim.schedule(function()
        local lazy_ok, lazy = pcall(require, "lazy")
        if lazy_ok then
          lazy.sync({ wait = false, show = false })
        end
        vim.cmd("silent! MasonToolsUpdate --install-once")
        mark_updated()
      end)
    end
  end,
})

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

local set = vim.opt
set.number = true
set.relativenumber = true
set.cursorline = true
set.ruler = true
set.hlsearch = true

-- 折叠（由 treesitter.lua 中设置 foldmethod/foldexpr）
set.foldenable = true
set.foldlevelstart = 99

-- 缩进：2 空格
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- 搜索
set.ignorecase = true
set.smartcase = true

-- 禁止备份
set.backup = false
set.writebackup = false
set.swapfile = false

set.wrap = true
