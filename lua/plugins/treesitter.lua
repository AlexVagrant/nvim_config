return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- ── 前置检查：nvim-treesitter v1.0 编译解析器需要 tree-sitter-cli + C 编译器 ──
      local missing = {}
      if vim.fn.executable('tree-sitter') == 0 then
        table.insert(missing, 'tree-sitter-cli  →  brew install tree-sitter-cli')
      end
      if vim.fn.executable('cc') == 0 then
        table.insert(missing, 'C 编译器        →  xcode-select --install')
      end

      if #missing > 0 then
        vim.schedule(function()
          vim.notify(
            '[nvim-treesitter] 缺少依赖，解析器无法编译安装:\n  • '
              .. table.concat(missing, '\n  • '),
            vim.log.levels.WARN,
            { title = 'nvim-treesitter' }
          )
        end)
      end

      -- nvim-treesitter v1.0: setup 只接受 install_dir
      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath('data') .. '/site',
      }

      -- 安装所需语言解析器（异步，已安装的会跳过）
      if #missing == 0 then
        require('nvim-treesitter').install {
          'cpp', 'dot', 'vim', 'lua', 'rust', 'toml',
          'javascript', 'typescript', 'vue', 'scss', 'css', 'html',
        }
      end

      -- Neovim 0.12+ 原生 treesitter 折叠
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.o.foldlevelstart = 99
    end,
  },
}
