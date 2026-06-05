-- 系统依赖检查（首次启动时一次性提示）
-- 每个插件的必需依赖，缺失时给出安装命令

local M = {}

-- deps 定义：{ 命令名, 用途, 安装命令 (macOS), 安装命令 (Linux apt) }
M.deps = {
  { bin = 'tree-sitter',  why = 'nvim-treesitter 编译解析器', brew = 'brew install tree-sitter-cli', apt = 'cargo install tree-sitter-cli' },
  { bin = 'cc',           why = 'nvim-treesitter 编译 C 代码',  brew = 'xcode-select --install',      apt = 'sudo apt install build-essential' },
  { bin = 'curl',         why = 'nvim-treesitter 下载源码',      brew = nil,                           apt = 'sudo apt install curl' },
  { bin = 'tar',          why = 'nvim-treesitter 解压源码',      brew = nil,                           apt = 'sudo apt install tar' },
  { bin = 'rg',           why = 'Telescope 全局搜索 (live_grep)',brew = 'brew install ripgrep',        apt = 'sudo apt install ripgrep' },
  { bin = 'fd',           why = 'Telescope 文件查找 (find_files)',brew = 'brew install fd',            apt = 'sudo apt install fd-find' },
  { bin = 'lazygit',      why = 'lazygit.nvim Git TUI',          brew = 'brew install lazygit',        apt = 'sudo apt install lazygit' },
  { bin = 'trash',        why = 'nvim-tree 回收站删除',          brew = 'brew install trash',          apt = 'sudo apt install trash-cli' },
}

function M.check()
  local missing = {}
  for _, dep in ipairs(M.deps) do
    if vim.fn.executable(dep.bin) == 0 then
      local install_cmd
      if vim.fn.has('mac') == 1 then
        install_cmd = dep.brew
      else
        install_cmd = dep.apt
      end
      table.insert(missing, dep.bin .. '  (' .. dep.why .. ')' .. (install_cmd and '\n    → ' .. install_cmd or ''))
    end
  end

  if #missing == 0 then
    return true
  end

  vim.schedule(function()
    local title = '缺少系统依赖 (' .. #missing .. '/' .. #M.deps .. ' 项)'
    local body = table.concat(missing, '\n\n')
    -- 用两种方式提示，确保用户看到
    vim.notify(body, vim.log.levels.WARN, { title = title, timeout = 15000 })
    -- 同时输出到命令行，方便复制安装
    vim.api.nvim_echo({
      { title .. ':\n\n', 'WarningMsg' },
      { body .. '\n\n', 'Comment' },
      { '以上依赖不影响 Neovim 启动，但对应插件功能不可用。\n', 'Normal' },
    }, true, {})
  end)

  return false
end

return M
