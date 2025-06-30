
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "luckasRanarison/tailwind-tools.nvim",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      { "hrsh7th/cmp-emoji", enabled = vim.g.is_mac },
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup {
        snippet = {
          expand = function(args)
            -- Not using ultisnips for now
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Esc>"] = cmp.mapping.close(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer", keyword_length = 2 },
          { name = "emoji", insert = true },
        },
        completion = {
          keyword_length = 1,
          completeopt = "menu,noselect",
        },
        view = {
          entries = "custom",
        },
        formatting = {
          fields = {
            cmp.ItemField.Kind,
            cmp.ItemField.Abbr,
            cmp.ItemField.Menu,
          },
          format = lspkind.cmp_format {
            before = require("tailwind-tools.cmp").lspkind_format,
            mode = "symbol_text",
            menu = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              buffer = "[Buffer]",
              emoji = "[Emoji]",
              omni = "[Omni]",
            },
          },
        },
      }

      cmp.setup.filetype("tex", {
        sources = {
          { name = "omni" },
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        },
      })

      vim.cmd([[
        highlight! link CmpItemMenu Comment
        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]])
    end
  },
}
