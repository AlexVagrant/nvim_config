
return {
  'simrat39/rust-tools.nvim',
  config = function ()
    local rt = require("rust-tools")
    local keymap = vim.keymap
    local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
    local opts = {
      tools = {
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },

      server = {
        on_attach = function(_, bufnr)
          keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
      }
    }
    rt.setup(opts)
  end
}
