-- rustaceanvim 是 rust-tools.nvim 的现代化替代品
-- 专为 Neovim 0.10+ 设计，使用新的 vim.lsp API
return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  dependencies = {
    'mfussenegger/nvim-dap', -- rustaceanvim 调试功能所需 (checkhealth 提示)
  },
  config = function()
    vim.g.rustaceanvim = {
      -- 插件配置
      tools = {
      },
      -- LSP 配置
      server = {
        on_attach = function(client, bufnr)
          local keymap = vim.keymap
          -- Hover actions
          keymap.set("n", "<C-space>", function()
            vim.cmd.RustLsp('hover', 'actions')
          end, { buffer = bufnr, desc = "Rust hover actions" })
          
          -- Code action groups
          keymap.set("n", "<Leader>a", function()
            vim.cmd.RustLsp('codeAction')
          end, { buffer = bufnr, desc = "Rust code actions" })
          
          -- 其他有用的 Rust 特定功能
          keymap.set("n", "<Leader>rr", function()
            vim.cmd.RustLsp('runnables')
          end, { buffer = bufnr, desc = "Rust runnables" })
          
          keymap.set("n", "<Leader>rd", function()
            vim.cmd.RustLsp('debuggables')
          end, { buffer = bufnr, desc = "Rust debuggables" })
        end,
        default_settings = {
          -- rust-analyzer 语言服务器配置
          ['rust-analyzer'] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      -- DAP 配置（可选）
      dap = {
      },
    }
  end,
}
