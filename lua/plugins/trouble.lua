return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "切换诊断面板",
    },
    {
      "<leader>xw",
      "<cmd>Trouble lsp_references<cr>",
      desc = "光标处引用（Trouble 面板）",
    },
  },
  opts = {
    modes = {
      lsp_references = {
        auto_open = true,
        focus = false,
        mode = "lsp_references",
        params = {
          includeDeclaration = false,
        },
      },
    },
  },
}
